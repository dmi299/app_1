import 'package:graphql_flutter/graphql_flutter.dart';
// void fetchFirstData() {
//     var productsGraphQL2 = """
//                                             query MyQuery{
//                                               patient_users(where: {id: {_eq: "${patientUserId}"}}, limit: 1) {
//                                                 birthday
//                                                 fullname
//                                                 password
//                                                 id
//                                                 phone_number
//                                                 patient {
//                                                   fullname
//                                                   gender
//                                                   email
//                                                   birthday
//                                                   age
//                                                   address
//                                                 }
//                                               }
//                                             }
//                                           """;
//     Future<QueryResult> sendRequest() async {
//       print("sending request");
//       var client2 = GraphQLProvider.of(context).value;
//       var hello = await client2.query(QueryOptions(
//         document: gql(productsGraphQL2),
//       ));
//       return hello;
//     }

//     void calcular() {
//       setState(
//         () {
//           print("Sending request${patientUserId}");
//           sendRequest().then(
//             (value) {
//               a = patientUserId;
//               patient = value.data!['patient_users'][0];
//               print(patient);
//             },
//           );
//         },
//       );
//     }
//   }