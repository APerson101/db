import {defineBackend} from '@aws-amplify/backend';
import {auth} from './auth/resource';
import {data} from './data/resource';
import { apis} from './functions/apis/resource';
import {LambdaRestApi } from "aws-cdk-lib/aws-apigateway";
import { Stack } from 'aws-cdk-lib';


const backend=defineBackend({
  auth,
  data,
  apis
});

const apiGatewayStack = backend.createStack("apigateway-stack");
const myAPI = new LambdaRestApi(apiGatewayStack, "MyApi", {
  handler: backend.apis.resources.lambda,
  proxy:false
});
const getUsers=myAPI.root.addResource('getUsers',);
getUsers.addMethod("GET");


const getPendingSupply=myAPI.root.addResource('getPendingSupply',);
getPendingSupply.addMethod("GET");

const getAll=myAPI.root.addResource('getAllSupplies',);
getAll.addMethod("GET");

const getUser=myAPI.root.addResource('getUser',);
getUser.addMethod("GET");

const getStockCard=myAPI.root.addResource('getfacilityStockCardWithDates',);
getStockCard.addMethod("GET");

const creastTest=myAPI.root.addResource('createTestPerson',);
creastTest.addMethod("GET");

const getfacilityStockCard =myAPI.root.addResource('getfacilityStockCard',);
getfacilityStockCard.addMethod("GET");

const meData=myAPI.root.addResource('MEData',);
meData.addMethod("POST" );

const confirmSupply=myAPI.root.addResource('confirmSupply',);
confirmSupply.addMethod("POST" );


const deleteAll=myAPI.root.addResource('deleteAll',);
deleteAll.addMethod("POST" );

const createUser=myAPI.root.addResource('createUser',);
createUser.addMethod("POST" );

const createProduct=myAPI.root.addResource('createNewProduct',);
createProduct.addMethod("POST" );

const addToInventory=myAPI.root.addResource('addToInventory',);
addToInventory.addMethod("POST" );


const getInventory=myAPI.root.addResource('getInventory',);
getInventory.addMethod("GET" );


const createNewSupply=myAPI.root.addResource('createNewSupply',);
createNewSupply.addMethod("POST" );

const getSomeFacilitiesGet = myAPI.root.addResource('getAllFacilities')
getSomeFacilitiesGet.addMethod("GET")

const getFacilitiesGet = myAPI.root.addResource('getFacilities')
getFacilitiesGet.addMethod("GET")

const createFacilityResource=myAPI.root.addResource('createFacility',);
createFacilityResource.addMethod("POST" );

const assignUserToFacilityResource=myAPI.root.addResource('assignUserToFacility',);
assignUserToFacilityResource.addMethod("POST" );

const createFacilityTrainingRes=myAPI.root.addResource('createFacilityTraining',);
createFacilityTrainingRes.addMethod("POST" );

const createStaffTrainingRes=myAPI.root.addResource('createStaffTraining',);
createStaffTrainingRes.addMethod("POST" );

backend.addOutput({
  custom: {
    apiId: myAPI.restApiId,
    apiEndpoint: myAPI.url,
    apiName: myAPI.restApiName,
    apiRegion: Stack.of(apiGatewayStack).region,
  },
});