"""
https://www.hackerrank.com/challenges/nested-list/problem


Given the names and grades for each student in a class of N students, store them in a nested list and print the
name(s) of any student(s) having the second lowest grade.

Note: If there are multiple students with the second lowest grade, order their names alphabetically and print
each name on a new line.

Input Format:

The first line contains an integer, N, the number of students.
The 2N subsequent lines describe each student over 2 lines.
- The first line contains a student's name.
- The second line contains their grade.

Output Format:

Print the name(s) of any student(s) having the second lowest grade in. If there are multiple students, order
their names alphabetically and print each one on a new line.
"""

if __name__ == '__main__':

    n = int(input())
    
    students = []
    
    for _ in range(n):
        name = input()
        score = float(input())
        students.append([name, score])
        
    students.sort(key=lambda x: (x[1], x[0]))
    
    second_lowest_score = next(score for _, score in students if score > students[0][1])
    
    result_students = [name for name, score in students if score == second_lowest_score]
    
    for student in sorted(result_students):
        print(student)