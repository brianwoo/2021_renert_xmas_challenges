import 'dart:io';

// level 1
// List<List<int>> grid = [[0,0], [0,0]];
// const gridLimit = 9999;

List<List<int>> grid = [[0,0,0], [0,0,0], [0,0,0]];
const gridLimit = 999999999;

final dimension = grid.length; // means N x N


bool isAbleToIncrement(int gridNum) {
    return (gridNum < gridLimit);
}

void incrementGrid() {
    int gridNum = gridToNum(grid);
    if (isAbleToIncrement(gridNum)) {
        gridNum++;
    }
    grid = numToGrid(gridNum);
}

int gridToNum(List grid) {
    String gridStr = "";
    for (int i=0; i < dimension; i++) {
        gridStr += listToNumStr(grid[i]);
    }
    return int.parse(gridStr);
}


List<List<int>> numToGrid(int numsInGrid) {
    List<List<int>> newGrid = [];
    var numStr = numsInGrid.toString().padLeft(dimension*dimension,'0');

    int i = 0;
    while (i < numStr.length) {
        List<int> newList = [];
        for (int y=0; y < dimension; y++) {
            // print('$numStr, $i');
            int num = int.parse(numStr[i]);
            newList.add(num);
            i++;
        }
        newGrid.add(newList);
    }
    return newGrid;
}


String listToNumStr(List<int> list) {
    var listOfNumStr = list.map((i) => i.toString());
    String numStr = listOfNumStr.join();
    return numStr;
}

int getNumFromList(List<int> list) {
    String numStr = listToNumStr(list);
    return int.parse(numStr);
}

List<int> getRow(int i) {
    return grid[i];
}

List<int> getCol(int i) {
    List<int> col = [];
    for (int row=0; row < dimension; row++) {
        col.add(grid[row][i]);
    }
    return col;
}

//=======================================================
// Level 1 conditions
//=======================================================
bool isMultipleOf3And2() {
    List<int> col = getCol(0);
    int numsFromCol = getNumFromList(col);
    bool isDivisibleBy3 = (numsFromCol % 3 == 0);
    bool isDivisibleBy2 = (numsFromCol % 2 == 0);
    return (isDivisibleBy3 && isDivisibleBy2);
}

bool isBetween30And60() {
    List<int> col = getCol(1);
    int numsFromCol = getNumFromList(col);
    return (30 <= numsFromCol) && (numsFromCol <= 60);
}

bool isNotMultipleOf2Or5() {
    List<int> row = getRow(0);
    int numsFromRow = getNumFromList(row);
    bool isNotDivisibleBy2 = (numsFromRow % 2 != 0);
    bool isNotDivisibleBy5 = (numsFromRow % 5 != 0);
    return (isNotDivisibleBy5 && isNotDivisibleBy2);
}

bool isSumOfDigitsEquals17() {
    List<int> row = getRow(1);
    int sum = row.reduce((a, b) => a + b);
    return sum == 17;
}

void doLevel1() {
    while (gridToNum(grid) <= gridLimit) {

        bool isCondMultipleOf3And2 = isMultipleOf3And2();
        bool isCondBetween30And60 = isBetween30And60();
        bool isCondNotMultipleOf2Or5 = isNotMultipleOf2Or5();        
        bool isCondSumOfDigitsEquals17 = isSumOfDigitsEquals17();

        if (isCondMultipleOf3And2 && isCondBetween30And60 && isCondNotMultipleOf2Or5 && isCondSumOfDigitsEquals17) 
            print(grid);

        if (isAbleToIncrement(gridToNum(grid)))
            incrementGrid();
        else
            break;
    }
}


//=======================================================
// Level 2 conditions
//=======================================================
bool listEquality<T>(List<T> a, List<T> b) {
  if (a == null) return b == null;
  if (b == null || a.length != b.length) return false;
  if (identical(a, b)) return true;
  for (var index = 0; index < a.length; index += 1) {
    if (a[index] != b[index]) return false;
  }
  return true;
}

bool isPalindrome(List<int> listOfNum) {

    List<int> reverse = [];

    int length = listOfNum.length;
    for (int i = length-1; i>= 0; i--) {
        reverse.add(listOfNum[i]);
    }
    return listEquality(listOfNum, reverse);
}

bool isSumEquals18() {
    List<int> col = getCol(0);
    int sum = col.reduce((a, b) => a + b);
    return sum == 18;
}

bool isMultipleOf9() {
    List<int> col = getCol(1);
    int numsFromCol = getNumFromList(col);
    bool isDivisibleBy9 = (numsFromCol % 9 == 0);
    return isDivisibleBy9;
}

bool isNotMultipleOf4() {
    List<int> col = getCol(2);
    int numsFromCol = getNumFromList(col);
    bool isNotDivisibleBy4 = (numsFromCol % 4 != 0);
    return isNotDivisibleBy4;
}

bool isListAPalindrome() {
    List<int> row = getRow(0);
    return isPalindrome(row);
}

bool isSumOfDigitsEquals25() {
    List<int> row = getRow(1);
    int sum = row.reduce((a, b) => a + b);
    return sum == 25;
}

bool isFactorialOfANumber() {
    // note, if it's a 3-digit number, it can only go up to 999.
    // We don't have to test all the numbers, but just
    // the number with the following factorals (1-6 factorials)
    List<int> factorialNums = [1,2,6,24,120,720];

    List<int> row = getRow(2);
    int numFromRow = getNumFromList(row);
    return factorialNums.any((e) => e == numFromRow);
}

void doLevel2() {
    while (gridToNum(grid) <= gridLimit) {

        // print(gridToNum(grid));

        bool isCondSumEquals18 = isSumEquals18();
        bool isCondMultipleOf9 = isMultipleOf9();
        bool isCondNotMultipleOf4 = isNotMultipleOf4();        
        bool isCondListAPalindrome = isListAPalindrome();
        bool isCondSumOfDigitsEquals25 = isSumOfDigitsEquals25();
        bool isCondFactorialOfANumber = isFactorialOfANumber();

        if (isCondSumEquals18 && isCondMultipleOf9 && isCondNotMultipleOf4 && isCondListAPalindrome && isCondSumOfDigitsEquals25 && isCondFactorialOfANumber) 
            print(grid);

        if (isAbleToIncrement(gridToNum(grid)))
            incrementGrid();
        else
            break;
    }
}



void main() {
    doLevel2();
}
