/*var sh = require('shelljs');
const fs = require('fs');
const sql = require('mssql');

let mstackToken = fs.readFileSync('./mstack.json');
let mstackTokenJson = JSON.parse(mstackToken);
let external_ip_db = mstackTokenJson.MSSQL_IP;
let token = mstackTokenJson.PAT;
let organizationName = mstackTokenJson.ORGANIZATION_NAME;

sh.exec(`export AZURE_DEVOPS_EXT_PAT=${token}`, {async: false, silent:true}).stdout;
sh.exec(`export myorganization=${organizationName}`, {async: false, silent:true}).stdout;
*/


var sh = require('shelljs');
const sql = require('mssql');
var mssqlIp = sh.exec('gcloud beta runtime-config configs variables get-value DEFAULT_MSSQL_IP --config-name $DEFAULT_CONFIG_NAME').stdout;
const config = {
    user: 'sa',
    password: 'Ctsshop@db',
    // server: '104.197.114.158',
    server: mssqlIp,
    options: {
        enableArithAbort: true,
        trustServerCertificate: true
    },
    requestTimeout: 10000,
 }

createDB();
useDB();


function createDB() {
    console.log("config.server >>>>>>>>>>>>>>> " +config.server)
    sql.connect(config).then(function () {
        var request = new sql.Request();
        request.query("create database ctsshop").then(function (resp) {
            sql.close();
        }).catch(function (err) {
            console.log('err' + err)
            sql.close();
        });
    }).catch(function (err) {
      console.log('Conn error ' + err)
    });
}

function useDB() {
        sql.connect(config).then(function () {
            var request = new sql.Request();
            request.query("USE ctsshop").then(function (resp) {
                sql.close();
            }).catch(function (err) {
              console.log('use err' + err)
                sql.close();
            });
        }).catch(function (err) {
              console.log('Use DB conn err ' + err)
        });
}

function showdatabases(){
     sql.connect(config).then(function () {
                var request = new sql.Request();
                request.query("show databases").then(function (resp) {
                   console.log('data bases :::: '+ resp);
                    sql.close();
                }).catch(function (err) {
                    sql.close();
                });
            }).catch(function (err) {

            });
}


