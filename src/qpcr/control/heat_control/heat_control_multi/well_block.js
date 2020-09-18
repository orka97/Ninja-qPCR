"use strict";

/*
  WellBlock class represents a single metal block.
  A device's well consists of one or more blocks.
*/
const DEFAULT_TEMP = 25.0;
const LOG_BUFF_CAPACITY = 10;

const OUTPUT_FIT_TOLERANCE = 0.05;
// Ring buffer of temp logs.
class TempLog {
  constructor () {
    this.buff = [];
    this.dataCount = 0;
    this.dataIndex = 0;
    this.prev = null;
  }
  getTDerivative () {
    // TODO
  }
  add (output, wellTemp, airTemp, timestampMsec) {
    const timestamp = timestampMsec / 1000.0;
    let slope = null;
    if (this.prev != null) {
      slope = (wellTemp - this.prev.w) / (timestamp - this.prev.t)
    }
    const obj = {
      p: output,
      w: wellTemp,
      a: airTemp,
      t: timestamp,
      slope: slope
    };
    if (this.buff.length < this.dataIndex) {
      this.buff.push(obj);
    } else {
      this.buff[this.dataIndex] = obj;
    }
    this.dataCount ++;
    this.dataIndex = (this.dataIndex + 1) % LOG_BUFF_CAPACITY;
    this.prev = obj;
  }
  reset () {
    this.buff = [];
    this.dataCount = 0;
    this.dataIndex = 0;
  }
  debug () {
    console.log(JSON.stringify(this.buff.map(d=>d.p)));
  }
  fit () {
    if (this.prev == null) {
      return;
    }
    const plot = this.buff.filter(
      (obj)=>{ return obj.slope != null && Math.abs(obj.p-this.prev.p) < OUTPUT_FIT_TOLERANCE }
    ).map(obj=>[(obj.w-obj.a),obj.slope]);
    let consts = linearFit(plot);
    // const a = consts.a;
    // const b = consts.b;
    const A = consts.a; // Slope
    const B = consts.b; // Y-intercept
    
    // Use this.prev
    const C = (this.prev.w - this.prev.a + B/A) / Math.exp(A * this.prev.t);
    console.log("CNST A=%f B=%f C=%f<=>", B, A, C, 1/A);
    const lgT = this.prev.a - B/A + C * Math.exp(A * this.prev.t)
    console.log("CNST? %f <=> %f", lgT, this.prev.w)
    let targetTemp = 90;
    let estimatedT = (1.0 / A) * Math.log((targetTemp-this.prev.a + B/A)/C);
    console.log("estimated=%f", estimatedT);
    return;
  }
}
function linearFit (plot) {
  /* Array of [x, y] arrays */
  let n=0, sumX=0, sumY=0, sumXY=0, sumXX=0;
  plot.forEach((p)=>{
    const x = p[0];
    const y = p[1];
    // console.log("%f\t%f", x, y);
    n += 1;
    sumX += x;
    sumY += y;
    sumXY += x * y;
    sumXX += x * x;
  });
  // console.log("sumX=%f, sumY=%f", sumX/n, sumY/n)
  const a = (n * sumXY - sumX * sumY) / 
    (n * sumXX - sumX * sumX);
  const b = (sumXX * sumY - sumXY * sumX) / 
    (n * sumXX - sumX * sumX);
    console.log("FIT %f, %f (n=%d)", a, b, n)
  return { a:a, b:b };
}
// Heating rate when wellTemp-airTemp=0 & full drive
const Y_INTERCEPT = 2.0; // deg/sec
const X_INTERCEPT = 110; // wellTemp - airTemp at the equilibrium
const MEASUREMENT_INTERVAL = 1.0;
const TOLERANCE_TEMP = 0.5;
class WellBlock {
  constructor (i) {
    this.tmpId = i;
    this.temperature = DEFAULT_TEMP;
    this.maxDriveRatio = 1.0;
    this.tempLog = new TempLog();
    this.dummyPowerCoeff = 0.8 + Math.random() * 0.3;
    this.targetAchieved = false;
    // TODO add dependencies to thermistor(s), heater and PID config
  }
  getDummyTemp (airTemp) {
    let tempDiff = this.temperature - airTemp;
    let rate = Y_INTERCEPT * (X_INTERCEPT - tempDiff) / X_INTERCEPT;
    rate = Math.max(0, Math.min(Y_INTERCEPT, rate));
    return this.temperature + MEASUREMENT_INTERVAL * rate * this.dummyPowerCoeff;
  }
  measureTemperature (airTemp, timestamp) {
    // Average temp of all blocks
    this.temperature = this.getDummyTemp(airTemp);
    // Achieved?
    if (!this.targetAchieved  && (this.temperature > this.targetTemperature != this.transitionStartTemperature > this.targetTemperature
      || Math.abs(this.temperature - this.targetTemperature) <= TOLERANCE_TEMP)) {
        // Target is between start & current or current temp is within the "tolerance" range
        console.log("Achieved. %f", this.temperature);
        this.targetAchieved = true;
      }
    const output = this.dummyPowerCoeff;
    
    this.tempLog.add (output, this.temperature, airTemp, timestamp);
    return new Promise ((resolve)=>{
      // TODO call thermistor & mux implementation.
      setTimeout(()=>{
        //console.log("Well temp measured done. %d %f %d", this.tmpId, airTemp, timestamp);
        resolve()
      }, 50);
    });
  }
  setTargetTemp (targetTemperature) {
    this.targetTemperature = targetTemperature;
    this.transitionStartTemperature = this.temperature;
  }
  setMaxDriveRatio () {
    
  }
  control () {
    // TODO PID
    // Set value with maxDriveRatio
  }
  update () {
    // Update coefficients
    // TODO fit
    this.tempLog.fit();
  }
  syncWith (rear) {
    // TODO random test.
    this.dummyPowerCoeff = 0.8 + Math.random() * 0.3;
    
  }
}

module.exports = WellBlock;