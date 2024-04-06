import {Amplify} from "aws-amplify";
import {generateClient} from "aws-amplify/data";
import config from "../../../amplifyconfiguration.json";
import type {Schema} from '../../data/resource';
import { ConsoleLogger } from "aws-amplify/utils";


Amplify.configure(config);

const client = generateClient<Schema>()

export async function getProducts() {
  const {errors, data} = await client.models.Product.list()
  console.log('products are: ')
  console.log(data);

  return data;
}


export async function getUsers() {
  const {errors, data} = await client.models.User.list({
    selectionSet:["id", "name", "email", "facility.name", "facility.id", "cadre", "facility.address", "microscopy.type", "microscopy.status.*"]
  })
  console.log('users are: ')
  console.log(data);
  console.log(errors)
  return data;
}

export async function deleteAll()
{

  const z=await client.models.TrainingInfo.list();
  for (let index = 0; index < z.data.length; index++) {
    const element = z.data[index];
    await client.models.TrainingInfo.delete({id:element.id});
  }

  const zz=await client.models.MicroscopistTraining.list();
  for (let index = 0; index < zz.data.length; index++) {
    const element = zz.data[index];
    await client.models.MicroscopistTraining.delete({id:element.id});
  }


  const zzz=await client.models.MicroscopesInfo.list();
  for (let index = 0; index < zzz.data.length; index++) {
    const element = zzz.data[index];
    await client.models.MicroscopesInfo.delete({id:element.id});
  }
  const data=await client.models.Facility.list();
  for (let index = 0; index < data.data.length; index++) {
    const element = data.data[index];
    await client.models.Facility.delete({id:element.id});
  }


  const d2=await client.models.User.list();
  for (let index = 0; index < d2.data.length; index++) {
    const element = d2.data[index];
    await client.models.User.delete({id:element.id??""});
  }
  const d3=await client.models.Inventory.list();
  for (let index = 0; index < d3.data.length; index++) {
    const element = d3.data[index];
    await client.models.Inventory.delete({id:element.id});
  }

  const d4=await client.models.Product.list();
  for (let index = 0; index < d4.data.length; index++) {
    const element = d4.data[index];
    await client.models.Product.delete({id:element.id});
  }
  const d5=await client.models.Supply.list();
  for (let index = 0; index < d5.data.length; index++) {
    const element = d5.data[index];
    await client.models.Supply.delete({id:element.id});
  }

  const d6=await client.models.ProductBatch.list();
  for (let index = 0; index < d6.data.length; index++) {
    const element = d6.data[index];
    await client.models.ProductBatch.delete({id:element.id});
  }

  const d7=await client.models.PQuantity.list();
  for (let index = 0; index < d7.data.length; index++) {
    const element = d7.data[index];
    await client.models.PQuantity.delete({id:element.id});
  }


  const d8=await client.models.StockCard.list();
  for (let index = 0; index < d8.data.length; index++) {
    const element = d8.data[index];
    await client.models.StockCard.delete({id:element.id});
  }
  await testGetters();

  return "BURST";
}


export async function testGetters()
{
  const supplyData=await client.models.Supply.list()
  console.log('supply data',supplyData.data)
  console.log(supplyData.errors)

  const pquantityData = await client.models.PQuantity.list();
  console.log('pquantity data',pquantityData.data)
  console.log(pquantityData.errors)

  const stockCard = await client.models.StockCard.list()
  console.log('stock card',stockCard.data)
  console.log(stockCard.errors)




}
export async function getUser(email:string)
{

 const stocks= await client.models.StockCard.list({
selectionSet:["id",]
  }, );
  await client.models.StockCard.update({
    id: stocks.data[0].id,
    type:"INCOMING"
  })
  await client.models.StockCard.update({
    id: stocks.data[1].id,
    type:"INCOMING"
  })
 const {data} =await client.models.User.list({
  filter:{
    email: {eq:email}
  },
  selectionSet:["name", "designation", "state", "lga", "userFacilityId", "id", "facility.name", "facility.inventorySummary.id"]
});
console.log("the user is: ")
console.log(data[0])
return data;
}


export async function getLgaUsers(state:string){
  const  {data, errors}= await client.models.User.list({
    filter:{
      and: [
        {state: {
          eq: state,
        },},

        {
lga:{ne:undefined}
        },
        {
          or:[
            {designation:{
              eq:"LGA_SUPERVISOR"
            }},
          ]
        }
      ]
    },
    selectionSet:["name", "email", "primaryNumber", "secondaryNumber", "lga","facility.name", "facility.id"]
  });
  console.log("here are the users with state: ", state, data);
  return data;
}

export async function getStateManagerUsers(state:string){
  const  {data, errors}= await client.models.User.list({
    filter:{

      and:[
        {or:
        [
          {designation:{ne:undefined}},
          {partner:{ne:undefined}}
        
        ]},

        {
          state:{
            eq:state
          }
        }
      ]
    },

    selectionSet:["name", "designation","primaryNumber", "secondaryNumber", "email", "id",]
  });
  console.log("here are the managers/partners for the entire state", data);
  return data;
}
export async function getZoneManagerUsers(zone:string){
  const  {data, errors}= await client.models.User.list({
    filter:{

      and:[
        {or:
        [
          {designation:{ne:undefined}},
          {partner:{ne:undefined}}
        
        ]},

        {
          zone:{
            eq:zone
          }
        },

        {
          state: {
            eq:undefined
          }
        }
      ]
    },

    selectionSet:["name", "designation","primaryNumber", "secondaryNumber", "email", "id",]
  });
  console.log("here are the managers/partners for the entire zone", data);
  return data;
}

export async function usageStats(state:string)
{

const {data}=await client.models.StockCard.list({
  filter: {
    and: [
      {facilityStockCardId:{
      beginsWith: "abua"
    }},
    {date:{ge:"2001-12-12"}},

    {date:{le:"2005-12-12"}},
    {
      quantityIssued : {ge: "1"}
    }
    ]
  },
  selectionSet:["facilityStockCardId", "quantityIssued",  "date", "stockCardProductId", "product.name", "product.id", "facility.id", "facility.name", "facility.lga"]
});
const mappedFacilities:Record<string, any>=data.reduce((mapped:Record<string, any>, item)=>{
 const facilityId:any= item["facilityStockCardId"]
 mapped[facilityId] = (mapped[facilityId] || []).concat(item);
 return mapped;
}, {})

const newRecord: Record<string, any> = {};

for (const key in mappedFacilities) {
  const facilityStats=mappedFacilities[key];
  const drugsFacility:Record<string, any>=facilityStats.reduce((drugMapped:any, item:any)=>{
    const productId:any = item['stockCardProductId']
    drugMapped[productId] = (drugMapped[productId] || []).concat(item);
    return drugMapped;
  }, {});
  const updateddrugsFacility= {name:data.filter((ea)=>ea.facilityStockCardId==key)[0].facility.name, id: key,  products: drugsFacility }
  newRecord[key] = updateddrugsFacility
}

console.log(JSON.stringify(newRecord, null,2));

return newRecord;

  const a = `query($minDate:String!, $state:String!){
    listStockCards(filter:{ date: {ge:$minDate} }){
      items{
    id,
    date,
    quantityIssued,
    facility
    {
      name
    }
}}
}`; 
}

export async function getFacility(id:string) {
  const {errors, data} = await client.models.Facility.get({id:id})
  console.log('faciliy info is: ')
  const trainings=await data.trainings();
  console.log(trainings.data)
  console.log(data.trainings)
  return data;
}
export async function getFacilities() {
  const {errors, data} = await client.models.Facility.list({
    filter: {
      and:[
        {type:{
          eq:"FACILITY"
        }},
      ]
    
    }, 
    
    selectionSet:["name", "lga", "id", "address", "contact.name", "contact.email", "contact.cadre", "contact.primaryNumber", "contact.secondaryNumber", "trainings.*",
    "level", "operation", "tbhiv", "microscopy", 
    ]
  });
  console.log(data);
  console.log(errors)
  return data;
}
export async function getAllFacilities(location:any) {
  const {errors, data} = await client.models.Facility.list({
filter: {

  and:[
    {type:{
      eq:"FACILITY"
    }},
    location??{state:{eq:null}}
  ]

}, 

selectionSet:["name", "id", "address", "contact.name", "contact.email", "contact.cadre", "contact.primaryNumber", "contact.secondaryNumber", "trainings.*",
"level", "operation", "tbhiv", "microscopy", "microscopyContact.email",
"microscopyContact.name", 
"microscopyContact.primaryNumber", 
"microscopyContact.secondaryNumber",
 "microscopesInfo.*"
]
},
)


  console.log(JSON.stringify(data, null, 2))
return data ;
}


export async function getZonalFacilities(zone:string) {
  const {errors, data} = await client.models.Facility.list({
    filter: {
      zone: {
        eq: zone
      }
    }
  })
  console.log('facility in the zone are: ')
  console.log(data);
  return data;
}



export async function getStoreInventory(storeId:string) {
  const data=await client.models.Inventory.get({
    id: 
      storeId
    
  });
}
export async function getAllInvetoryForState(state:string) {
  const {data, errors} = await client.models.Facility.list({
    filter: {
      state: {
        eq:state
      }
    }
  });

  for (let index = 0; index < data.length; index++) {
    const element = data[index];
    const invSummary=(await element.inventorySummary()).data;

}}


export async function getAllUserSupplies(receiverId: string) {
  const {errors, data} = await client.models.Supply.list(
    {
      filter: {
        supplyReceiverId: {
          eq: receiverId
        }
      }
    }
  )
  console.log("User's data is: ", data);
}


export async function getPendingSupply(receiverId:string)
{
  const result=await client.models.Supply.list({
    filter: {
      and: [
        {supplyReceiverId: {eq:receiverId}, 
      
      },
        {status: {eq:"SENT"}, 
      
      },
      ]
    }, 
    selectionSet:["id", "sender.name", "sendDate", "products.*", "products.product.*"]
  });

  console.log(result.errors)
  console.log(result.data)
  return result.data
}
export async function getAllSupplies()
{
  const result=await client.models.Supply.list();

  console.log(result.errors)
  console.log(result.data)
  return result.data
}
export async function getSupply()
{
  const result=await client.models.Supply.get({id:"06e019fb-c374-4175-806f-7f82b56f7a7e"}, {

    selectionSet:["id", "sender.name", "sendDate", "products.*", "products.product.*"]

  });

  console.log(result.errors)
  console.log(result.data)
  return result.data
}


export async function getfacilityStockCard(facilityId:string, drugId:string)
{
  const stockForProduct=await client.models.StockCard.list({
    filter: {
      and: [
        {facilityStockCardId: {eq: facilityId}},

        {stockCardProductId: {eq:drugId}},
      ]
    },

    selectionSet:[
      "date",
      "product.name",
      "product.id",
      "batchNo",
      "facilityStockCardId",
      "receiver",
      "quantityIssued",
      "expiryDate",
      "type",
      "lossesAdjustements",
      "quantityReceived",
      "stockBalance",
      "remarks"
    ]
  })
  console.log(stockForProduct.data)
  return stockForProduct.data;
}
export async function getfacilityStockCardWithDates(facilityId:string, minDate: string, maxDate:string)
{
  const stockForProduct=await client.models.StockCard.list({
    filter: {
      and: [
        {facilityStockCardId: {eq: facilityId}},
        // {stockCardProductId: {eq:drugId}},
        {date:{ge:minDate}},
        {date: {le:maxDate}}
      ]
    },

    selectionSet:[
      "date",
      "product.name",
      "product.id",
      "batchNo",
      "facilityStockCardId",
      "stockCardProductId",
      "receiver",
      "quantityIssued",
      "quantityReceived",
      "stockBalance",
      "remarks"
    ]
  })
  console.log(stockForProduct.data)
  return stockForProduct.data;
}



export async function getInventory(inventoryId:string)
{
  try {

    const data= await client.models.Inventory.list(
      {
        filter:{id:{eq:inventoryId}},
    selectionSet:["facility.id", "facility.name", "facility.address", "items.*","items.product.*", "items.batchInfo.batch", "items.batchInfo.expiryDate"]}
    );
    console.log(data.errors);
    console.log(data.data);
    return data.data
  } catch(e)
  {
    console.log(e)
    return null
  }
}

export async function getQForm(facilityId:string, quarter:string)
{
  const {data}=await client.models.QForm.list({
    filter:{
      and:[
        {qFormFacilityId: {eq:facilityId}},
        {quarter: {eq:quarter}},
      ]
    },
    selectionSet:[
      "facility.name", "facility.id", "productInfo.id", "productInfo.name", "quarter", "physicalInventory", "user.id", "user.name"
    ]
  });
  return data;
}
