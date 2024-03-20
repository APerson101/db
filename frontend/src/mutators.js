"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.getAllBatchesForDrug = exports.changeDeliveryItemStatus = void 0;
const aws_amplify_1 = require("aws-amplify");
const data_1 = require("aws-amplify/data");
const amplifyconfiguration_json_1 = __importDefault(require("./amplifyconfiguration.json"));
aws_amplify_1.Amplify.configure(amplifyconfiguration_json_1.default);
const client = (0, data_1.generateClient)();
function changeDeliveryItemStatus(item) {
    return __awaiter(this, void 0, void 0, function* () {
        yield client.models.DeliveryItem.update(item);
    });
}
exports.changeDeliveryItemStatus = changeDeliveryItemStatus;
function getAllBatchesForDrug(product) {
    return __awaiter(this, void 0, void 0, function* () {
        const { errors, data } = yield client.models.ProductBatch.list({
            filter: {
                productBatchProductId: {
                    eq: product.id
                },
                productBatchLocationId: {
                    eq: product.location
                }
            }
        });
    });
}
exports.getAllBatchesForDrug = getAllBatchesForDrug;