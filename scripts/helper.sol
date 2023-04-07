import * as fs from "fs";

export const readAddressList = function () {
  return JSON.parse(fs.readFileSync("address.json", "utf-8"));
};

export const storeAddressList = function (addressList) {
  fs.writeFileSync("address.json", JSON.stringify(addressList, null, "\t"));
};