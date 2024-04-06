import {Amplify} from "aws-amplify";
import {generateClient} from "aws-amplify/data";
import config from "../../../amplifyconfiguration.json";
import type {Schema} from '../../data/resource';

Amplify.configure(config);
const client = generateClient<Schema>()

export async function createUser(user: any) {
  try {
    console.log('Creating new user....');
    const data=await client.models.User.create(user);
    console.log('new user created');
    console.log(data.data);
    console.log(data.errors);
    return data.errors==undefined?true:false;
  }
  catch (error) {
    console.log(error);
    return false;
  }
}
export async function createNewFacility(facility: any ) {
  try {
    console.log("Creating new facility...."); 
    const status=await client.models.Facility.create({...facility});    
    await client.models.Inventory.create({
      inventoryFacilityId: facility.id,
      id: facility.facilityInventorySummaryId
    });

    console.log(status.errors);
    console.log(status.data);
    console.log('new facility created');
    return status.data;
  }
  catch (error) {
    console.log(error);
    return false;
  }
}


export async function createNewStaffTraining(training: any) {
  // try {
  //   console.log("Updating staff  training")
  // await client.models.MicroscopistTraining.create(training);
  //   console.log('new training created');
  //   return true;
  // }
  // catch (error) {
  //   console.log(error);
  //   return false;
  // }
}


export async function MEData(tbcases:any)
{
  await client.models.MEData.create(tbcases);
}
export async function createNewFacilityTraining(training: any) {
  try {

    await client.models.TrainingInfo.create(training);
    return true;
  }
  catch (error) {
    console.log(error);
    return false;
  }
}
export async function createNewMicroscopeInfo(microscope: any) {
  try {
 await client.models.MicroscopesInfo.create(microscope);
    return true;
  }
  catch (error) {
    console.log(error);
    return false;
  }
}
export async function getAllScopes() {
//   try {
// const trainigs=    (await client.models.MicroscopesInfo.list()).data;
//     console.log(trainigs);
//     return true;
//   }
//   catch (error) {
//     console.log(error);
//     return false;
//   }
}
export async function getAllTrainings() {
//   try {
// const trainigs=    (await client.models.TrainingInfo.list()).data;
//     console.log(trainigs);
//     return true;
//   }
//   catch (error) {
//     console.log(error);
//     return false;
//   }
}
export async function createNewProduct(product: any) {
  try {
    await client.models.Product.create(product);
    console.log('new Product created');
    return true;
  }
  catch (error) {
    console.log(error);
    return false;
  }
}
export async function createNewSupply(supply: any, productBatches:any[]) {
  try {
    const supplyData=await client.models.Supply.create(supply);
    console.log(supplyData.errors)
    console.log(supplyData.data)
    for (let index = 0; index < productBatches.length; index++) {
      const productBatch = productBatches[index];
      const pbatch= await client.models.ProductBatch.create({ 
        productBatchProductId: productBatch.productBatchProductId,
        batch: productBatch.batch,
        supplyProductsId: productBatch.supplyProductsId,
        quantity:productBatch. quantity,
        expiryDate: productBatch.expiryDate,})
        console.log(pbatch.errors)
        console.log(pbatch.data)
        
        
        const stockData=await client.models.StockCard.create({
          quantityIssued: productBatch.quantity,
          receiver: supply.supplyReceiverId,
          lossesAdjustements: 0, 
          stockBalance: productBatch.stockBalance,
          batchNo: productBatch.batch, 
          expiryDate: productBatch.expiryDate, 
          date: productBatch.dateTime,
          type:"OUTGOING",
          facilityStockCardId: supply.supplySenderId,
          stockCardProductId: productBatch.productBatchProductId,
        });
        console.log(stockData.errors)
        console.log(stockData.data)
        
        const currentLatest=(await client.models.PQuantity.update({
          id: productBatch.itemQuantityId,
          quantity: productBatch.newQuantity
        }));
        console.log(currentLatest.errors)
        console.log(currentLatest.data)
      
    }
  }
  catch (error) {
    console.log(error);
    return false;
  }
}

export async function confirmSupply(supplyId:string, info:any[], senderName:string, facilityId:string, inventoryID:string)
{
  await client.models.Discrepancy.create({})
  const supplyStatus=await client.models.Supply.update({
    id:supplyId,
    status:"RECEIVED"
  });
  console.log(supplyStatus.errors);
  console.log(supplyStatus.data);
  for (let index = 0; index < info.length; index++) {
    const element = info[index];
   const pqStatus= await client.models.PQuantity.create({
      pQuantityProductId:element.productId,
      quantity:element.quantity,
      pQuantityBatchInfoId:element.batchId,
      inventoryItemsId:inventoryID
    });

    console.log(pqStatus.errors)
    console.log(pqStatus.data)
    const scard=await client.models.StockCard.create({
      quantityReceived: element.quantity,
      receiver:senderName,
      lossesAdjustements: 0, 
      stockBalance: element.stockBalance,
      batchNo: element.batchNo, 
      expiryDate: element.expiryDate, 
      date: element.date,
      type:"INCOMING",
      facilityStockCardId: facilityId,
      stockCardProductId: element.productId,
    })
    console.log(scard.data)
    console.log(scard.errors)
  }

  return true;
}

export async function addToInventory(supply:any,warehouseId:string, productBatches:any[], inventoryId:string, others:any[]):Promise<boolean> {
  try 
  {
    console.log("creating supply...")
    const supplyData= await client.models.Supply.create(supply);
    console.log("supply errors:", supplyData.errors);
    for (let index = 0; index < productBatches.length; index++) {
      const productBatch = productBatches[index];
  
      console.log("creating batch...")
      const batchdata=await client.models.ProductBatch.create(productBatches[index]);
      console.log("batch erros:", batchdata.errors);
      console.log("creating PQuantity...")

      const qdata=await client.models.PQuantity.create({
        inventoryItemsId:inventoryId,
        pQuantityProductId: productBatch.productBatchProductId,
        quantity: productBatch.quantity,
        pQuantityBatchInfoId:batchdata.data.id
      });
      // await client.models.ProductBatch.update({id: batchdata.data.id,productBatchPqInfoId:qdata.data.id})
      //  await client.models.ProductBatch.update({
      //   id:batchdata.data.id,
      //   productBatchPqInfoId: qdata.data.id })
      console.log("pquantity erros:", qdata.errors);
      console.log("creating StockCard");


    const stockData=await client.models.StockCard.create({
      quantityReceived: productBatch.quantity,
      receiver: warehouseId,
      lossesAdjustements: others[index].lossesAdjustements, 
      stockBalance: others[index].stockBalance,
      batchNo: productBatch.batch, 
      expiryDate: productBatch.expiryDate, 
      date: others[index].date,
      type:"INCOMING",
      facilityStockCardId: warehouseId,
      stockCardProductId: productBatch.productBatchProductId,
    });
    console.log("stock card erros:", stockData.errors);
  }
  return true;
}

catch(e)
{
  console.log(e)
  return false;
}
}


export async function addDiscrepancy(supplyId:string, sent:number, received:number)
{
  const dpcy=await client.models.Discrepancy.create({
    discrepancySupplyId: supplyId,
    sent: sent,
    received:received
  });
  console.log(dpcy.data)
  console.log(dpcy.errors)
  return true;
}