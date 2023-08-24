<?php

use Illuminate\Database\Seeder;
use App\Models\Student;
use App\Models\Teacher;

class UsersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Student::create([
            "name" => "student1",
            "email" => "student1@gmail.com",
            'password' => bcrypt('student1'),
        ]);
        Student::create([
            "name" => "student2",
            "email" => "student2@gmail.com",
            'password' => bcrypt('student2'),
        ]);
        Student::create([
            "name" => "student3",
            "email" => "student3@gmail.com",
            'password' => bcrypt('student3'),
        ]);

        Teacher::create([
            "name" => "teacher1",
            "email" => "teacher1@gmail.com",
            'password' => bcrypt('teacher1'),
        ]);
        Teacher::create([
            "name" => "teacher2",
            "email" => "teacher2@gmail.com",
            'password' => bcrypt('teacher2'),
        ]);
        Teacher::create([
            "name" => "teacher3",
            "email" => "teacher3@gmail.com",
            'password' => bcrypt('teacher3'),
        ]);
    }
}
