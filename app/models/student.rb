class Student
    attr_reader :first_name
    @@all = []

    def initialize (first_name)
        @first_name = first_name
        
        @@all << self
    end

    def self.all
        @@all
    end

    def add_boating_test(test_name, test_status, instructor)
        BoatingTest.new(self, test_name, test_status, instructor)
    end

    def all_instructors
        all_tests = BoatingTest.all.select{|test| test.student == self}
        all_tests.map{|test| test.instructor}
    end

    def self.find_student(first_name)
        self.all.find{|student| student.first_name == first_name}
    end

    def grade_percentage
        all_tests = BoatingTest.all.select{|test| test.student == self}
        passed_tests = all_tests.select{|test| test.test_status == "passed"}
        (passed_tests.length.to_f / all_tests.length.to_f) * 100
    end
end
