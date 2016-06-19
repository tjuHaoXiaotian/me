/**
 * Created by jack on 2016/5/28.
 */

var Schedule = {
    mapping : ['first','second','third','fourth','noon','fifth','sixth','seventh','eighth','ninth','tenth','eleventh'],
    values:[],
    init : function(){
        Schedule.values[Schedule.mapping[0]] = "上午：第1节课";
        Schedule.values[Schedule.mapping[1]] = "上午：第2节课";
        Schedule.values[Schedule.mapping[2]] = "上午：第3节课";
        Schedule.values[Schedule.mapping[3]] = "上午：第4节课";
        Schedule.values[Schedule.mapping[4]] = "午休时间";
        Schedule.values[Schedule.mapping[5]] = "下午：第5节课";
        Schedule.values[Schedule.mapping[6]] = "下午：第6节课";
        Schedule.values[Schedule.mapping[7]] = "下午：第7节课";
        Schedule.values[Schedule.mapping[8]] = "下午：第8节课";
        Schedule.values[Schedule.mapping[9]] = "晚上：第9节课";
        Schedule.values[Schedule.mapping[10]] = "晚上：第10节课";
        Schedule.values[Schedule.mapping[11]] = "晚上：第11节课";
    },
    get:function(name){
        return Schedule.values[name];
    }

};
Schedule.init();

    
    


