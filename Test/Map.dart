void main() {
Map<String, String> stateNamesByStateCode =
{"AL": "Alamaba",
"AK": "Alaska",
"AR": "Arkansas",
"AZ": "Arizona"
};
stateNamesByStateCode["GA"] = "Georgia";
for (String key in stateNamesByStateCode.keys){
print(key); 
}
print("\nGet just one: ${stateNamesByStateCode["AK"]}");
}