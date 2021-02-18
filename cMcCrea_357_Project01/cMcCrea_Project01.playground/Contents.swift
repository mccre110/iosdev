//Swift Insertion
let test = [1.1,1.0,5.0,6.7,2.0]
print(insertionSort(funArr: test))
func insertionSort(funArr: [Double])->[Double]{
    var arr = funArr
    for i in 1..<Int(arr.count) {
        let tp : Double = arr[i]
        var j : Int = i-1
        while (j>=0) && (arr[j] > tp){
            arr[j+1] = arr[j]
            j-=1
        }
        arr[j+1] = tp
    }
    return arr
}


//void Algo::insertionSort(double arr[])
//{
//        //print time
//    cout << "Insertion Sort:" << endl;
//    time_t now = time(0);
//    tm* localtm = localtime(&now);
//    cout << "Start: " << asctime(localtm);
//
//    for (int i = 1; i < this->size; i++)
//    {
//        double tp = arr[i];
//        int j = i-1;
//        //this loop doesnt run if section is sorted already
//        while (j >= 0 && arr[j] > tp)
//        {
//            arr[j+1] = arr[j];
//            j--;
//        }
//        arr[j+1] = tp;
//    }
//        //print time
//    now = time(0);
//    localtm = localtime(&now);
//    cout << "End:   " << asctime(localtm) <<endl;
//}
