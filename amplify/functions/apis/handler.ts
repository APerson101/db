import { Schema } from "../../data/resource";
import {generateClient} from "aws-amplify/data";
import config from "../../../amplifyconfiguration.json";
import { Amplify } from "aws-amplify";
import type { APIGatewayProxyHandlerV2  } from "aws-lambda";
import { MEData, addDiscrepancy, addToInventory, confirmSupply, createNewFacility, createNewFacilityTraining, createNewMicroscopeInfo, createNewProduct, createNewStaffTraining, createNewSupply, createUser } from "./creators";
import { deleteAll, getAllFacilities, 
  getFacilities,
   getInventory, getUser, getUsers, getfacilityStockCardWithDates, getfacilityStockCard, getPendingSupply, getAllSupplies, getSupply } from "./getter";
import { assignUserToFacility } from "./mutators";

Amplify.configure(config)
const client = generateClient<Schema>()
export const handler : APIGatewayProxyHandlerV2= async (event:any) => {
  console.log(event.path);
  console.log(event);
const resource = (event.path as string).replace("/","");
const invalidBody={
  headers: {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Headers": "*",
  },
  body:"invalid body",
  statusCode: 500
};

const returnSuccess= {
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Headers": "*",
    },
    body:"true",
    statusCode:200
}

if(resource==undefined)
     {invalidBody.body="omo invalid resource requested"
     return invalidBody}
else
{switch (resource)
{

  case 'createUser':
    try{
      const status= await createUser(JSON.parse(event.body!))
      return {
        statusCode: 200,
        headers: {
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Headers": "*",
        },
        body: status.toString(),
      };
    }
    catch(e)
    {
      return {
        statusCode: 500,
        headers: {
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Headers": "*",
        },
        body: 'Body is null',
      };
    }
    case 'getUsers':
      try {
        const users=await getUsers();
        return {
          body: JSON.stringify(users),
          statusCode:200
        }
      }
      catch(e)
      {
        return {
          statusCode:500,
          body:"Failed to get the users"
        }
      }

      case 'deleteAll':
        await deleteAll();
        return {
          statusCode: 200,
          body:"HOPEFULLY DONE"
        }
    case 'getUser':
      try {
        const users=await getUser(event.queryStringParameters?.email??"");
        return {
          body: JSON.stringify(users),
          statusCode:200
        }
      }
      catch(e)
      {
        return {
          statusCode:500,
          body:"Failed to get the users"
        }
      }

    case 'getFacilities':
    try {
      const facilities= await getFacilities();
      return {
        body:JSON.stringify(facilities),
        statusCode:200
      }
    }
    catch(e)
    {
      return {
        statusCode: 500,
        body:"omo, i no know weten happen ohhh"
      };
    }
    case 'getAllFacilities':
      const region = event.queryStringParameters?.region;
      let location=null;
      
      console.log(location)
      const facilites=await getAllFacilities(location);
      return  {
        statusCode: 200,
        headers: {
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Headers": "*",
        },
        body: JSON.stringify(facilites),
      };


      case 'createFacility':
        try
        {
          const facilityJson= JSON.parse(event.body!).facility
        await createNewFacility(facilityJson);
        return {
          body: "true",
          headers: {
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Headers": "*",
        },
        statusCode:200
      }
    }
        
        catch (e)
        {
          return {
            statusCode: 500,
            body: "invalid body"
          }
        }
      case 'createFacilityTraining':
        try
          {const trainings = JSON.parse(event.body!);
          await createNewFacilityTraining(trainings);

          return returnSuccess;
        }

        catch (e)
        {
          return invalidBody;
        }

          case 'createStaffTraining':
            try {
              const Stafftrainings = JSON.parse(event.body!);
            await createNewStaffTraining(Stafftrainings);
            return returnSuccess
          }

            catch(e)
            {
              return invalidBody
            }
          case 'createMicroscope':
            try
            {const microscope = JSON.parse(event.body!);
            await createNewMicroscopeInfo(microscope);
          return returnSuccess
          }

          catch(e)
          {
            return invalidBody
          }

          case 'assignUserToFacility':
            try {
            await assignUserToFacility(JSON.parse(event.body!).facilityId, JSON.parse(event.body!).userId, JSON.parse(event.body!).microscopist );
            return returnSuccess;
            }
            catch(e)
            {
              return invalidBody
            }

          case 'addToInventory':
            try {
              const supply:string=JSON.parse(event.body!).supply;
              const warehouseId:string=JSON.parse(event.body!).warehouseId;
              const productsInfo:any[]=JSON.parse(event.body!).products;
              const inventoryId:string = JSON.parse(event.body!).inventoryId;
              const others:any[] = JSON.parse(event.body!).others;
              const response:boolean =await addToInventory(supply, warehouseId, productsInfo, inventoryId, others);
                return {
                  statusCode: response?200:500,
                  body: response?"SUCCESS":"FAILED"
                }
            }

            catch(e)
            {
              return {
                statusCode: 500, 
                body: "failed for some reason"
              }
            }
            case 'createNewProduct':
              try {
                const val=await createNewProduct(JSON.parse(event.body!));
                return {
statusCode:val?200:500,
body:val?"SUCCESS":"FAILURE"
                }
              }
              catch(e){
                return invalidBody
              }            


              case "getAllSupplies":
                const body=await getAllSupplies();
                return {
                  statusCode:200,
                  body:JSON.stringify(body)
                }


              case "getPendingSupply":
                try {
                  // const body=await getPendingSupply(event.queryStringParameters?.receiverId)
                  const body=await getSupply()
                  return {
                    statusCode:200, 
                    body: JSON.stringify([body])
                  }
                } catch (error) {
                  return invalidBody
                }
              
              
              case "createNewSupply":
                try {
                  const response=await createNewSupply(
                    JSON.parse(event.body).supply, 
                  JSON.parse(event.body).productBatches, 
                  );
                  return {
                    statusCode: response?200:500,
                    body: "response"
                  }
                }
                catch (e)
                {
                  return invalidBody;
                }

                case "addDiscrepancy":
                  try {
                    await addDiscrepancy(JSON.parse(event.body))

                  }catch(_){
                    return {statusCode:500, body:"ERROR"}
                  }
              case "confirmSupply":
                try {
                  const response=await confirmSupply(
                    JSON.parse(event.body).supplyId, 
                  JSON.parse(event.body).data, 
                  JSON.parse(event.body).senderName, 
                  JSON.parse(event.body).facilityId, 
                  JSON.parse(event.body).inventoryID, 
                  );
                  return {
                    statusCode: 200,
                    body: "response"
                  }
                }
                catch (e)
                {
                  return invalidBody;
                }

                case "MEData":
                  try {
                    await MEData(JSON.parse(event.body!));
                    return {
                      statusCode:200,
                      body:"success"
                    }
                  }
                  catch(e)
                  {
                    return {statusCode:500, 
                    body:"failed"}
                  }

                case "getfacilityStockCard":
                   try{
                    const facilityId= event.queryStringParameters?.facilityId;
                    const productId = event.queryStringParameters?.productId;
                    const values= await getfacilityStockCard(facilityId, productId);
                  return {
                    statusCode:200,
                    body: JSON.stringify(values)
                  }
                  }
                   catch(_){
                    return {
                      statusCode: 500,
                      body: "Bad request"
                    };
                   }
                case "getfacilityStockCardWithDates":
                   try{
                    const facilityId= event.queryStringParameters?.facilityId;
                    const minDate = event.queryStringParameters?.minDate;
                    const maxDate = event.queryStringParameters?.maxDate;
                    const values= await getfacilityStockCardWithDates(facilityId, minDate, maxDate);
                  return {
                    statusCode:200,
                    body: JSON.stringify(values)
                  }
                  }
                   catch(_){
                    return {
                      statusCode: 500,
                      body: "Bad request"
                    };
                   }
            case 'getInventory':
              try {
      const facilityId = event.queryStringParameters?.facilityId;
      console.log(facilityId)
      const inv=await getInventory(facilityId);
      return {
        statusCode:200,
        body: JSON.stringify(inv)
      }
              }
              catch(e)
              {
                return {
                  statusCode:500,
                  body:"something happened"
                }
              }
              
              default:
              return {
                headers: {
                  "Access-Control-Allow-Origin": "*",
                  "Access-Control-Allow-Headers": "*",
                },
                body:"invalid, pick something else",
                statusCode: 500
              }
        

    }
  }
  }; 








