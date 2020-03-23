//TODO: imports


//TODO: List of employee
//TODO:Stream controller


//TODO:Stream Sink getter
//TODO:Constructor-> add data; listen to change/update

//TODO:core function

//TODO: dispiose , the most imppp

// import statement
import 'dart:async';
import 'Employee.dart';

class EmployeeBlock{
    //--- sink to add in pipe
    //--- stream to get data from pipe
    //--- pipe refers data flow
  //list of employee
  List<Employee> _employeeList= [
    Employee(1,"One Employee",10000.0),
    Employee(2,"two Employee",20000.0),
    Employee(3,"three Employee",30000.0),
    Employee(4,"four Employee",40000.0),
    Employee(5,"five Employee",50000.0),
    Employee(6,"six Employee",60000.0),
    Employee(7,"Seven Employee",65000.0),
    Employee(8,"Eight Employee",70000.0),
  ];

  final _employeeListStreamController = StreamController<List<Employee>>();

  final _employeeSalaryIncrementStreamController = StreamController<Employee>();
  final _employeeSalaryDecrementStreamController = StreamController<Employee>();

  //stream sink getter
  Stream<List<Employee>> get employeeListStream => 
  _employeeListStreamController.stream;

  StreamSink<List<Employee>> get employeeListSink =>
  _employeeListStreamController.sink;

  //for increment and decrement
  StreamSink<Employee> get employeeSalaryIncrement =>
  _employeeSalaryIncrementStreamController.sink;

  StreamSink<Employee> get employeeSalaryDecrement =>
  _employeeSalaryDecrementStreamController.sink;

  //creating constructor 

  EmployeeBlock(){
    //adding data to variable from constructor
    _employeeListStreamController.add(_employeeList);

    // calling getter
    _employeeSalaryIncrementStreamController.stream.listen(_incrementSalary);
    _employeeSalaryDecrementStreamController.stream.listen(_decrementSalary);

  }

  //create core function for increment and decrement salary
  _incrementSalary(Employee employee){
    double salary = employee.salary;
    double newincrementedsalary = salary * 20/100;
    _employeeList[employee.id - 1].salary = salary + newincrementedsalary;
    employeeListSink.add(_employeeList);

  }

  _decrementSalary(Employee employee){
    double salary = employee.salary;
    double newdecrementedsalary = salary * 20/100;
    _employeeList[employee.id - 1].salary = salary - newdecrementedsalary;
    employeeListSink.add(_employeeList);
  }

  //- most impp ----dispose and free all the resourse
  void dispose(){
    _employeeListStreamController.close();
    _employeeSalaryIncrementStreamController.close();
    _employeeSalaryDecrementStreamController.close();
  }

}