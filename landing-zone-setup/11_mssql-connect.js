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
const sql = require('mssql');
const config = {
    user: 'sa',
    password: 'Ctsshop@db',
    server: '35.237.14.90',
    options: {
        "enableArithAbort": true
        //trustServerCertificate: true
    },
    requestTimeout: 10000,
 }

createDB();
useDB();
showdatabases();

function createDB() {
    sql.connect(config).then(function () {
        var request = new sql.Request();
        request.query("create database ctsshop").then(function (resp) {
            sql.close();
        }).catch(function (err) {
            sql.close();
        });
    }).catch(function (err) {
    });
}

function useDB() {
        sql.connect(config).then(function () {
            var request = new sql.Request();
            request.query("USE ctsshop").then(function (resp) {
                sql.close();
            }).catch(function (err) {
                sql.close();
            });
        }).catch(function (err) {

        });
}

function showdatabases(){
     sql.connect(config).then(function () {
                var request = new sql.Request();
                request.query("show databases").then(function (resp) {
                    sql.close();
                }).catch(function (err) {
                    sql.close();
                });
            }).catch(function (err) {

            });
}


