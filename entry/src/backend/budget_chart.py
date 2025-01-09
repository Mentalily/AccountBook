import matplotlib.pyplot as plt

def create_pie_chart(budget, expenditure):
    labels = ['Expenditure', 'Remaining']
    sizes = [expenditure, budget - expenditure]
    colors = ['#ff9999','#66b3ff']

    fig, ax = plt.subplots()
    ax.pie(sizes, labels=labels, colors=colors, startangle=90, wedgeprops={'width': 0.3})
    ax.axis('equal')
    plt.title('Budget vs Expenditure')
    fig.savefig('budget_ring.png', format='png')

