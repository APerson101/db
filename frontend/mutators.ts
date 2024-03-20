import {Amplify} from "aws-amplify";
import {generateClient} from "aws-amplify/data";
import config from "./amplifyconfiguration.json";
import type {Schema} from './rs';

Amplify.configure(config);

const client = generateClient<Schema>()

export async function changeDeliveryItemStatus(item: any) {
  await client.models.DeliveryItem.update(item);
}


export async function getAllBatchesForDrug(product: any) {
  const {errors, data} = await client.models.ProductBatch.list({
    filter: {
      productBatchProductId: {
        eq: product.id
      },
      productBatchLocationId: {
        eq: product.location
      }
    }
  });


}