/*function add(a, b) {
    if (typeof a === "number" && typeof b === "number") {
        return (typeof a + typeof b +"|"+ a + b);
    } else {
        return (a + "," + b + "必须都是数字");
    }
}*/


sayHello = function (name) {
    alert("hello " + name)
}

function add(a, b) {
    if (isNaN(Number(a)) || isNaN(Number(b)) ){
        return a + "," + b + "必须为数字!"
    } else {
        return a + "+" + b + "=" + (Number(a) + Number(b))
    }
}

