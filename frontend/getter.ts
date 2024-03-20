import {Amplify} from "aws-amplify";
import {generateClient} from "aws-amplify/data";
import config from "./amplifyconfiguration.json";
import type {Schema} from './rs';


Amplify.configure(config);

const client = generateClient<Schema>()

export async function getItems() {
  const {errors, data} = await client.models.Item.list()
  console.log('items are: ')
  console.log(data);

  return data;
}
export async function getUsers() {
  const {errors, data} = await client.models.User.list()
  console.log('users are: ')

  console.log(data);
  return data;
}
export async function getFacilities() {
  const {errors, data} = await client.models.Facility.list()
  console.log('facilities are: ')
  console.log(data);
  return data;
}

export async function getSuuplies() {
  const {errors, data} = await client.models.Supply.list()
  console.log('Supplies are: ')
  console.log(data);
  console.log('the sender is:', await data[0].sender())
  console.log('the receiver is:', await data[0].receiver())
  console.log('the items are:', await data[0].items())
  return data;
}
export async function getDeliveryItems() {
  const {errors, data} = await client.models.DeliveryItem.list()
  console.log('DeliveryItems are: ')
  console.log(data);
  return data;
}

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

export async function getDeliveryItem(itemId: string) {
  console.log("The particular item in question has\nbeen retreived with the following details")
  return await client.models.DeliveryItem.get({id: itemId});
}