from flask import Flask, send_from_directory, request
from budget_chart import create_pie_chart
import os

app = Flask(__name__)

@app.route('/', methods=['GET'])
# def generate_budget_ring():
#     data = request.json  # 从前端接收 JSON 数据
#     budget = data['budget']
#     expenditure = data['expenditure']
#     create_pie_chart(budget, expenditure)  # 调用函数生成图像
#     return send_from_directory(os.getcwd(), 'budget_ring.png')  # 返回图像

def home():
    return "Hello, Flask!"

if __name__ == "__main__":
    app.run(debug=True)
