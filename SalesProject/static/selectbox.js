$(document).ready(function() {
// Initializing arrays with city names.
var furniture = [
{display: "Chairs",value: "Chairs"},
{display: "Furnishings", value: "Furnishings"},
{display: "Bookcases",value: "Bookcases"},
{display: "Tables",value: "Tables"},
var officesupplies = [{
display: "Paper",value: "Paper"},
{display: "Labels",value: "Labels"},
{display: "Storage",value: "Storage"},
{display: "Binders",value: "Binders"},
{display: "Art",value: "Art"}
{display: "Fasteners",value: "Fasteners"}
{display: "Envelopes",value: "Envelopes"}
{display: "Appliances",value: "Appliances"}
{display: "Supplies",value: "Supplies"}
];
var technology = [{
display: "Phones",value: "Phones"},
{display: "Accessories",value: "Accessories"},
{ display: "Machines",value: "Machines"},
{display: "Copiers", value: "Copiers"}];
// Function executes on change of first select option field.
$("#Category").change(function() {
var select = $("#Category option:selected").val();
document.write(select)
switch (select) {
case "furniture":
subcategory(furniture);
break;
case "officesupplies":
subcategory(officesupplies);
break;
case "technology":
subcategory(technology);
break;
default:
$("#Sub-Category").empty();
$("#Sub-Category").append("<option>--Select--</option>");
break;
}
});
// Function To List out Cities in Second Select tags
function subcategory(arr) {
$("#Sub-Category").empty(); //To reset cities
$("#Sub-Category").append("<option>--Select--</option>");
$(arr).each(function(i) { //to list cities
$("#Sub-Category").append("<option value="" + arr[i].value + "">" + arr[i].display + "</option>")
});
}
};