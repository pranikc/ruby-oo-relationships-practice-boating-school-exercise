class Instructor
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        
        @@all << self
    end

    def self.all
        @@all
    end

    def passed_students
        passed_tests = BoatingTest.all.select{|test| test.instructor == self && test.test_status == "passed"}
        passed_tests.map{|test| test.student}
    end

    def passed_student(student, test_name)
        test_instance = BoatingTest.all.find{|test| test.student == student && test.test_name == test_name}
        if test_instance != nil
               test_instance.test_status = "passed"
               test_instance
        else 
		BoatingTest.new(student. test_name, "passed", self)
        end
    end

    def fail_student(student, test_name)
        test_instance = BoatingTest.all.find{|test| test.student == student && test.test_name == test_name}
        if test_instance != nil
               test_instance.test_status = "failed"
               test_instance
        else 
		BoatingTest.new(student. test_name, "failed", self)
        end
    end

    def all_students
        all_tests = BoatingTest.all.select{|test| test.instructor == self}
        all_tests.map{|test| test.student}
    end
end
