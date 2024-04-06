import { defineFunction } from '@aws-amplify/backend';

export const apis: any = defineFunction({
    entry: './handler.ts',
    name:"apis"
    
  });
    