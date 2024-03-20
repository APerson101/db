import {Amplify} from "aws-amplify";
import {generateClient} from "aws-amplify/data";
import config from "./amplifyconfiguration.json";
import type {Schema} from './rs';


Amplify.configure(config);

const client = generateClient<Schema>()


export async function createUser(user: any) {
  try {
    await client.models.User.create(user);
    console.log('new user created');

    return true;
  }
  catch (error) {
    console.log(error);
    return false;
  }
}
export async function createNewFacility(facility: any) {
  try {
    await client.models.User.create({

    });
    await client.models.Facility.create(facility);
    console.log('new facility created');
    return true;
  }
  catch (error) {
    console.log(error);
    return false;
  }
}
export async function createNewItem(product: any) {
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
export async function createNewSupply(supply: any) {
  try {
    const {data: supplyModel, errors} = await client.models.Supply.create(supply);
    console.log(supplyModel)
    console.log(errors)
    console.log('new Supply created');
    return supplyModel;
  }
  catch (error) {
    console.log(error);
    return false;
  }
}
export async function createDeliveryItem(supply: any, item: any) {
  try {
    const status = await client.models.DeliveryItem.create({
      id: "del 44421",
      supply: supply,
      product: item,
      quantity: 4,
      expiryDate: '2024-03-03',
      receivedDate: '2024-03-03'
    });
    console.log(status.errors);
    console.log(status.data);
    console.log('new DeliveryItem added');
    return true;
  }
  catch (error) {
    console.log(error);
    return false;
  }
}
