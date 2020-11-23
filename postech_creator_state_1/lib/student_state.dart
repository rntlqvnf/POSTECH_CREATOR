class Student_State {
  int age;
  int studentId;
  String name;

  Student_State({
    this.age,
    this.studentId,
    this.name,
  });

  String getFullInformation() {
    return '이름: $name, 나이: $age, 학번: $studentId';
  }
}
