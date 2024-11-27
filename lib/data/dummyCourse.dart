String dummyCourse = '''{
  "courses": [
    {
      "course_id": 1,
      "course_name": "Introduction to Programming",
      "modules": [
        {
          "module_id": 101,
          "module_name": "Getting Started with Programming",
          "description":
              "This module introduces the basics of programming, including variables, data types, and simple input/output operations.",
          "quiz": [
            {
              "question_id": 1,
              "question_text": "What is a variable in programming?",
              "options": [
                "A fixed value",
                "A container for storing data",
                "A programming language",
                "None of the above"
              ],
              "correct_answer": "A container for storing data"
            },
            {
              "question_id": 2,
              "question_text":
                  "Which data type is used to store decimal numbers?",
              "options": ["Integer", "String", "Float", "Boolean"],
              "correct_answer": "Float"
            }
          ]
        },
        {
          "module_id": 102,
          "module_name": "Control Structures",
          "description":
              "This module covers if-else statements, loops, and other control flow mechanisms.",
          "quiz": [
            {
              "question_id": 3,
              "question_text":
                  "Which loop is used when the number of iterations is known?",
              "options": [
                "for loop",
                "while loop",
                "do-while loop",
                "None of the above"
              ],
              "correct_answer": "for loop"
            },
            {
              "question_id": 4,
              "question_text": "What is the purpose of an if-else statement?",
              "options": [
                "To perform a specific task repeatedly",
                "To decide which block of code to execute",
                "To define a function",
                "To declare variables"
              ],
              "correct_answer": "To decide which block of code to execute"
            }
          ]
        }
      ]
    },
    {
      "course_id": 2,
      "course_name": "Data Science Basics",
      "modules": [
        {
          "module_id": 201,
          "module_name": "Introduction to Data Science",
          "description":
              "An overview of data science, its importance, and common tools used in the field.",
          "quiz": [
            {
              "question_id": 5,
              "question_text": "What is data science?",
              "options": [
                "The study of algorithms",
                "The field of collecting, analyzing, and interpreting data",
                "Building websites",
                "None of the above"
              ],
              "correct_answer":
                  "The field of collecting, analyzing, and interpreting data"
            },
            {
              "question_id": 6,
              "question_text":
                  "Which of the following is a commonly used tool in data science?",
              "options": ["Excel", "Python", "R", "All of the above"],
              "correct_answer": "All of the above"
            }
          ]
        },
        {
          "module_id": 202,
          "module_name": "Data Visualization",
          "description":
              "Learn how to create compelling visual representations of data using charts and graphs.",
          "quiz": [
            {
              "question_id": 7,
              "question_text":
                  "Which library is commonly used for data visualization in Python?",
              "options": ["Pandas", "NumPy", "Matplotlib", "SciPy"],
              "correct_answer": "Matplotlib"
            },
            {
              "question_id": 8,
              "question_text": "What is the purpose of a scatter plot?",
              "options": [
                "To show relationships between two variables",
                "To summarize data using averages",
                "To display trends over time",
                "None of the above"
              ],
              "correct_answer": "To show relationships between two variables"
            }
          ]
        }
      ]
    },
    {
      "course_id": 3,
      "course_name": "Web Development Fundamentals",
      "modules": [
        {
          "module_id": 301,
          "module_name": "HTML Basics",
          "description":
              "This module introduces the structure of web pages using HTML.",
          "quiz": [
            {
              "question_id": 9,
              "question_text": "What does HTML stand for?",
              "options": [
                "Hyperlinks and Text Markup Language",
                "Hyper Text Markup Language",
                "Home Tool Markup Language",
                "Hyper Tool Mark Language"
              ],
              "correct_answer": "Hyper Text Markup Language"
            },
            {
              "question_id": 10,
              "question_text": "Which HTML tag is used to create a hyperlink?",
              "options": ["<a>", "<link>", "<href>", "<url>"],
              "correct_answer": "<a>"
            }
          ]
        },
        {
          "module_id": 302,
          "module_name": "CSS Styling",
          "description":
              "Learn how to style web pages using Cascading Style Sheets.",
          "quiz": [
            {
              "question_id": 11,
              "question_text": "What does CSS stand for?",
              "options": [
                "Cascading Style Sheets",
                "Creative Style Sheets",
                "Computer Style Sheets",
                "Colorful Style Sheets"
              ],
              "correct_answer": "Cascading Style Sheets"
            },
            {
              "question_id": 12,
              "question_text": "Which CSS property controls the text size?",
              "options": [
                "font-size",
                "text-style",
                "font-weight",
                "text-size"
              ],
              "correct_answer": "font-size"
            }
          ]
        }
      ]
    },
    {
      "course_id": 4,
      "course_name": "Cybersecurity Essentials",
      "modules": [
        {
          "module_id": 401,
          "module_name": "Understanding Cyber Threats",
          "description":
              "This module explains different types of cyber threats and how to identify them.",
          "quiz": [
            {
              "question_id": 13,
              "question_text":
                  "Which of the following is a common type of malware?",
              "options": ["Virus", "Firewall", "Encryption", "Protocol"],
              "correct_answer": "Virus"
            },
            {
              "question_id": 14,
              "question_text": "What does phishing aim to do?",
              "options": [
                "Steal personal information",
                "Protect data from threats",
                "Provide technical support",
                "Optimize system performance"
              ],
              "correct_answer": "Steal personal information"
            }
          ]
        },
        {
          "module_id": 402,
          "module_name": "Best Practices for Security",
          "description":
              "Learn essential practices for maintaining cybersecurity.",
          "quiz": [
            {
              "question_id": 15,
              "question_text": "Which of the following is a strong password?",
              "options": ["123456", "P@ssw0rd!", "password", "qwerty"],
              "correct_answer": "P@ssw0rd!"
            },
            {
              "question_id": 16,
              "question_text":
                  "What is the purpose of two-factor authentication?",
              "options": [
                "To simplify the login process",
                "To add an extra layer of security",
                "To save password information",
                "To disable firewalls"
              ],
              "correct_answer": "To add an extra layer of security"
            }
          ]
        }
      ]
    },
    {
      "course_id": 5,
      "course_name": "Artificial Intelligence Overview",
      "modules": [
        {
          "module_id": 501,
          "module_name": "Introduction to AI",
          "description":
              "Understand the basics of artificial intelligence and its applications.",
          "quiz": [
            {
              "question_id": 17,
              "question_text": "What does AI stand for?",
              "options": [
                "Automated Intelligence",
                "Artificial Intelligence",
                "Advanced Information",
                "Algorithmic Intelligence"
              ],
              "correct_answer": "Artificial Intelligence"
            },
            {
              "question_id": 18,
              "question_text": "Which of these is an application of AI?",
              "options": [
                "Autonomous vehicles",
                "Speech recognition",
                "Predictive analytics",
                "All of the above"
              ],
              "correct_answer": "All of the above"
            }
          ]
        },
        {
          "module_id": 502,
          "module_name": "Machine Learning Basics",
          "description":
              "Learn how machines can learn from data and improve over time.",
          "quiz": [
            {
              "question_id": 19,
              "question_text": "What is machine learning?",
              "options": [
                "A subset of artificial intelligence",
                "Writing manual programs for every task",
                "Replacing human decision-making entirely",
                "None of the above"
              ],
              "correct_answer": "A subset of artificial intelligence"
            },
            {
              "question_id": 20,
              "question_text":
                  "Which algorithm is commonly used in supervised learning?",
              "options": [
                "K-means",
                "Linear Regression",
                "Apriori",
                "None of the above"
              ],
              "correct_answer": "Linear Regression"
            }
          ]
        }
      ]
    }
  ]
}
  ''';
