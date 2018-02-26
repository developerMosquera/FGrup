/*
* @Author: amosquera
* @Date:   2018-02-25 18:23:46
* @Last Modified by:   amosquera
* @Last Modified time: 2018-02-25 18:56:49
*/

var ctx = document.getElementById("myChart");
var myLineChart = new Chart(ctx, {
    type: 'line',
    data: {
    labels: ["Ene","Feb","Mar","Abr","May","Jun","Jul","Ago","Sep","Oct","Nov","Dic"],
    datasets: [{ 
        data: [1, 3, 5, 7, 9, 11, 13, 20, 15, 23, 27, 31],
        label: "Ingrid",
        borderColor: "#3e95cd",
        fill: false
      }, { 
        data: [7, 8, 9, 9, 15, 18, 15, 10, 7, 6, 10, 1],
        label: "Paulin",
        borderColor: "#8e5ea2",
        fill: false
      }, { 
        data: [2, 3, 4, 10, 11, 15, 20, 19, 19, 19, 22, 25],
        label: "Adriana",
        borderColor: "#3cba9f",
        fill: false
      }
    ]
  },
    options: {
      responsive: true,
      title:{
          display:true,
          text:'Ejecutados por mes'
      },
      tooltips: {
          mode: 'index',
          intersect: false,
      },
      hover: {
          mode: 'nearest',
          intersect: true
      },
      scales: {
          xAxes: [{
              display: true,
              scaleLabel: {
                  display: true,
                  labelString: 'Month'
              }
          }],
          yAxes: [{
              display: true,
              scaleLabel: {
                  display: true,
                  labelString: 'Value'
              }
          }]
      }
  }
});

new Chart(document.getElementById("bar-chart-grouped"), {
    type: 'bar',
    data: {
      labels: ["Ene", "Feb", "Mar", "Abr"],
      datasets: [
        {
          label: "Ingrid",
          backgroundColor: "#3e95cd",
          data: [33,21,83,8]
        }, {
          label: "Paulin",
          backgroundColor: "#8e5ea2",
          data: [18,17,15,4]
        },
        {
          label: "Adriana",
          backgroundColor: "green",
          data: [33,21,3,12]
        },
      ]
    },
    options: {
      title: {
        display: true,
        text: 'Population growth (millions)'
      }
    }
});