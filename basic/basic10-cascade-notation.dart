class Person {
  String name;
  String sex;
  int age;
  Skill skill;

  Person(this.name, this.sex, this.age);

  Person addSkill(Skill s) {
    this.skill = s;
    return this; //必须返回自身以支持后续的..操作符
  }
}

class Skill {
  String skillName;

  Skill(this.skillName);

  Skill printSkill() {
    print('[${this.skillName}]');
    return this; //这里返回Skill对象，并不会改变..操作符绑定的目标对象。
  }
}

void main() {
  var tom = Person('Tom', 'Male', 18);
  var s1 = Skill('爬山');

  tom.addSkill(s1)
    ..age = 20
    ..name = 'Sam'
    ..skill.printSkill()
    ..sex = 'Femal'; //虽然上一句函数返回了Skill对象，但是..操作符绑定的仍然是之前的Persion对象

  assert(tom.age == 20);
  assert(tom.name == 'Sam');
  assert(tom.sex == 'Femal');
  print(tom);
}
