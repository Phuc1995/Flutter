import 'dart:math';

void main() async {
  Future f = showInfomation();
  f.then((data) =>(data) { print(data); })
   .catchError((e) => print('Lỗi xảy ra - '+e.toString()));
  secondFunction();
}

const info = '#4fs358wredsfadsfdfdw';

getInfomation() {
    for (int i = 1; i<=1000; i++);
  throw new Exception('Không lấy được thông tin');
  return info;
}
Future<String> showInfomation() async{
  var data = await getInfomation();
  print('This is your data -' + DateTime.now().toString());
  print(data);
  return 'showInfomation Complete!';
}

secondFunction() {
  print('Thời gian - ' + DateTime.now().toString());
}









void countSeconds(s) {
  for( var i = 1 ; i <= s; i++ ) { 
      Future.delayed(Duration(seconds: i), () => print(i));
   }
}

Future<String> createOderMessage() async{
  var order = await getUserOrder();
  return "Your order is $order";
}

Future<String> getUserOrder(){
  return Future.delayed(Duration(seconds: 4), () => "Large Latte");
}

Future<bool> myTypedFuture(int id, int duration) async {

  await Future.delayed(Duration(seconds: duration));

  print("Duration: "+ duration.toString());
  print('Delay complete for Future $id');
  return true;
}
// Running multiple futures
Future runMultipleFutures() async {
  // Create list of multiple futures
  var futures = List<Future>();
  for(int i = 0; i < 10; i++) {
    print(i);
    futures.add(myTypedFuture(i, Random(i).nextInt(10)));
  }
  // Waif for all futures to complete
  await Future.wait(futures);
  // We're done with all futures execution
 
  print('All the futures has completed');
}

Future runTimeOut()async{

}