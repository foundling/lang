#define CATCH_CONFIG_MAIN
#include "catch.hpp"
#include <string>

class Person;
class Authority {
    public:
        void changeName(Person &, std::string);

};

void Authority::changeName(Person & p, std::string newName) {
    p.name = newName; 
};

class Person {

    public:
        Person(int age, std::string);
        std::string getName() const;
        int getAge() const;
        friend void agePerson(Person & p);
        friend void Authority::changeName(Person & p, std::string);

    private:
        int age;
        std::string name;
};

Person::Person(int age, std::string name) {
    this->age = age;
    this->name = name;
}

std::string Person::getName() const {
    return name;
}

int Person::getAge() const {
    return age;
}

void agePerson(Person & p) {
    p.age += 1;
}


TEST_CASE("basic") {

    Person p(25, "Allen");
    REQUIRE(p.getName() == "Allen");

}

TEST_CASE("friend") {

    Person p(25, "Allen");
    REQUIRE(p.getAge() == 25);
    agePerson(p);
    REQUIRE(p.getAge() == 26);

}
