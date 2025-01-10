import { AlertDialog, router } from '@kit.ArkUI'

interface TodayExpensesDetails {
  detail: string;
  tag: string;
  expense: number;
}

@Entry
@Component
struct Home {
  @State totalExpense : number = 0
  @State inputText : string = ""
  @State todayExpenses : Array<TodayExpensesDetails> = []
  @State alertMessage: string = "" // 弹窗内容
  @State showAlert: boolean = false // 控制弹窗显示

  // 输入文本数据处理
  handleInput() {
    // 解析字符串
    const match = this.inputText.match(/^(.*)#(.*) (\-?\d+)$/)
    if (!match) {
      console.log('erro')
      this.alertMessage = "输入格式请参看输入框提示😊"
      this.showAlert = true
      return;
    }
    // 提取解析结果
    const detail: string = match[1].trim();
    const tag: string = match[2].trim();
    const expense: number = parseFloat(match[3]);

    if (isNaN(expense)) {
      this.alertMessage = "真的没有输错金额吗😣"
      this.showAlert = true
      return;
    }

    this.totalExpense += expense;
    this.todayExpenses.push({detail, tag, expense})
    this.inputText = ""
  }

  build() {
    Column() {
      // 顶部导航栏
      Row(){
        Text("今日已支出：" + this.totalExpense)
          .fontSize($r('app.float.top_navigation_text_fontsize'))
          .margin({left : $r('app.float.top_navigation_margin')})
          .layoutWeight(1)
        Image($r('app.media.ic_public_share'))
          .width($r('app.float.navigation_icon_width'))
          .margin({right : $r('app.float.top_navigation_margin')})
      }
      .width('100%')
      .height($r('app.float.top_navigation_bar_height'))
      .border({
        width : {
          top : $r('app.float.top_navigation_bar_border_width'),
          bottom : $r('app.float.top_navigation_bar_border_width')
        },
        color : {
          top : Color.Black,
          bottom : Color.Black
        }
      })
      .backgroundColor(Color.White)

      // 数据显示区
      // CanvasBudgetRing()
      //   .layoutWeight(4)
      Column(){
        Text("这里预期是环形图，呈现预算和开销情况，同时允许设置预算，但也没来得及实现orz")
          .fontSize(20)
          .textAlign(TextAlign.Center)
          .lineHeight(50)
      }
      .justifyContent(FlexAlign.Center)
      .layoutWeight(4)
      .padding(10)
      .borderWidth({
        bottom : 3
      })
      .borderStyle(BorderStyle.Dotted)

      Column(){
        // 输入框
        Row(){
          Image($r('app.media.ic_public_more_list'))
            .width(30)
            .margin({
              top : 5,
              bottom : 5
            })

          TextInput({
            placeholder : "明细#标签[space]金额",
            text : this.inputText
          })
            .onChange((text : string) => {
              this.inputText = text
            })
            .height(50)
            .backgroundColor(Color.White)
            .borderRadius(0)
            .border({
              width : {
                left : 3,
                right : 3
              }
            })
            .layoutWeight(1)
          Image($r('app.media.ic_public_ok_filled'))
            .width(30)
            .margin({
              top : 5,
              bottom : 5
            })
            .onClick(() => {
              this.handleInput()
            })
        }
        .width('90%')
        .height(50)
        .justifyContent(FlexAlign.SpaceBetween)
        .border({
          width : 3
        })
        .borderRadius(10)
        if (this.showAlert) {
          AlertDialog({
            primaryTitle : "等等好像有点不对劲",
            content : this.alertMessage,
            primaryButton : {
              value : "Get!👌",
              action : ()=>{
                this.showAlert = false;
                this.inputText = ""
              }
            }
          })
        }

        // 明细显示
        Scroll(){
          Column(){
            ForEach(this.todayExpenses, (exp: TodayExpensesDetails) => {
              ExpenditureDetails({
                expenditure: exp.detail,
                tag: exp.tag,
                expense: exp.expense
              })
            })

          }
        }
        .scrollBar(BarState.Off)
      }
      .layoutWeight(5)
      .width('100%')
      .padding(10)

      // 底部导航栏
      Row() {
        // 账本区
        Image($r('app.media.ic_public_albums'))
          .width($r('app.float.navigation_icon_width'))
          .margin({left : $r('app.float.bottom_navigation_margin')})
          .onClick(()=>{
            router.pushUrl({
              url : 'pages/AccountBooksPreview'
            })
          })
        // 明细区
        Image($r('app.media.ic_public_add_norm_filled'))
          .width($r('app.float.navigation_icon_width'))
          .fillColor($r('app.color.add_fill'))
        // 资产区
        Image($r('app.media.ic_public_contacts'))
          .width($r('app.float.navigation_icon_width'))
          .margin({right : $r('app.float.bottom_navigation_margin')})
          .onClick(()=>{
            router.pushUrl({
              url : 'pages/User'
            })
          })
      }
      .width('100%')
      .height($r('app.float.bottom_navigation_bar_height'))
      .border({
        width : {
          top : $r('app.float.bottom_navigation_bar_border_width'),
          bottom : $r('app.float.bottom_navigation_bar_border_width')
        },
        color : {
          top : Color.Black,
          bottom : Color.Black
        }
      })
      .justifyContent(FlexAlign.SpaceBetween)
      .backgroundColor(Color.White)
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
  }

}

@Preview
@Component
struct ExpenditureDetails {
  @Prop expenditure: string
  @Prop tag: string
  @Prop expense: number
  build() {
    Row() {
      Text(this.expenditure)
        .fontSize(20)
      Row() {
        Text("#" + this.tag)
          .fontSize(20)
          .margin({right : 15})
          .fontColor(Color.Orange)
        Text((- this.expense).toString())
          .fontSize(20)
          .fontColor(Color.Red)
      }
    }
    .height(40)
    .width('90%')
    .border({
      width : {
        bottom : 2
      }
    })
    .justifyContent(FlexAlign.SpaceBetween)
    .padding({
      left : 10,
      right : 10
    })
  }
}



class ExpenditureDetailsClass {
  id: string = "";
  content: string = "";
  tag: string = "";
  expenditure: number = 0;

  constructor(id: string, content: string, tag: string, expenditure: number) {
    this.id = id;
    this.content = content;
    this.tag = tag;
    this.expenditure = expenditure;
  }
}

@Component
struct CanvasExample {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Canvas(this.context)
        .width('100%')
        .height('100%')
        .backgroundColor('#ffff00')
        .onReady(() => {
          this.context.fillRect(0, 30, 100, 100)
        })
    }
    .width('100%')
    .height('100%')
  }
}
@Preview
@Component
struct CanvasBudgetRing {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Canvas(this.context)
        .onReady(()=>{
          const ctx : CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
          const centerX = 150; // 圆心 X 坐标
          const centerY = 150; // 圆心 Y 坐标
          const radius = 100;  // 圆环半径
          const budget = 1000; // 预算
          const spent = 789;   // 已支出

          const spentAngle = (spent / budget) * 2 * Math.PI;

          // 绘制环底色
          ctx.beginPath();
          ctx.arc(centerX, centerY, radius, 0, 2 * Math.PI);
          ctx.lineWidth = 20; // 圆环宽度
          ctx.strokeStyle = '#e0e0e0'; // 底色
          ctx.stroke();

          // 绘制已支出部分
          ctx.beginPath();
          ctx.arc(centerX, centerY, radius, 0, spentAngle);
          ctx.strokeStyle = '#ff6347'; // 红色
          ctx.stroke();

          // 绘制剩余部分
          ctx.beginPath();
          ctx.arc(centerX, centerY, radius, spentAngle, 2 * Math.PI);
          ctx.strokeStyle = '#32cd32'; // 绿色
          ctx.stroke();

          // 绘制中间的文字
          ctx.fillStyle = 'black';
          ctx.font = '20px Arial';
          ctx.fillText(`${spent}/${budget}`, centerX - 40, centerY + 5); // 文本居中
        })
    }
    .width('100%')
  }
}

// @Preview
// @Component
// struct BudgetRing {
//   @Prop budget : number = 0;
//   @Prop expenditure : number = 0;
//   @State totalExpenditure : number = 0;
//   @State chartUrl: string = ""
//   // @State canvasContext: CanvasRenderingC
//   build() {
//
//     Stack(){
//       Canvas(/*{ width: 300, height: 300 }*/)
//         .width(300)
//         .height(300)
//         .onReady(/*(canvasContext: { getContext: (type: string) => CanvasRenderingContext2D }*/) => {
//           // const ctx = canvasContext.getContext('2d');
//           const ctx
//           const centerX = 150; // 圆心 X 坐标
//           const centerY = 150; // 圆心 Y 坐标
//           const radius = 100;  // 圆环半径
//           const budget = 1000; // 预算
//           const spent = 789;   // 已支出
//
//           const spentAngle = (spent / budget) * 2 * Math.PI;
//
//           // 绘制环底色
//           ctx.beginPath();
//           ctx.arc(centerX, centerY, radius, 0, 2 * Math.PI);
//           ctx.lineWidth = 20; // 圆环宽度
//           ctx.strokeStyle = '#e0e0e0'; // 底色
//           ctx.stroke();
//
//           // 绘制已支出部分
//           ctx.beginPath();
//           ctx.arc(centerX, centerY, radius, 0, spentAngle);
//           ctx.strokeStyle = '#ff6347'; // 红色
//           ctx.stroke();
//
//           // 绘制剩余部分
//           ctx.beginPath();
//           ctx.arc(centerX, centerY, radius, spentAngle, 2 * Math.PI);
//           ctx.strokeStyle = '#32cd32'; // 绿色
//           ctx.stroke();
//
//           // 绘制中间的文字
//           ctx.fillStyle = 'black';
//           ctx.font = '20px Arial';
//           ctx.fillText(`${spent}/${budget}`, centerX - 40, centerY + 5); // 文本居中
//         });
//
//
//
//       Image($r('app.media.ic_files_presentation_drive'))
//         .height(20)
//         .width(20)
//         .align(Alignment.TopStart)
//         .padding({
//           top : 0,
//           left : 0
//         })
//         .onClick(()=>{
//           // 弹出输入框设置预算
//         })
//     }
//     .width('100%')
//     .backgroundColor(Color.Gray)
//     // .height()
//   }
// }

// @Entry
// @Component
// struct BudgetChart {
//   @State budget: number = 1000;
//   @State spent: number = 789;
//
//   build() {
//     Column() {
//       Canvas({ id: 'canvasId', width: 300, height: 300 })
//         .width(300)
//         .height(300)
//         .onReady(() => this.drawChart());
//     }
//   }
//
//   drawChart() {
//     const canvas = this.$element('canvasId'); // 通过绑定的 ID 获取 Canvas
//     const ctx = canvas.getContext('2d'); // 获取 2D 上下文
//     const centerX = 150; // 圆心 X 坐标
//     const centerY = 150; // 圆心 Y 坐标
//     const radius = 100;  // 圆环半径
//
//     const spentAngle = (this.spent / this.budget) * 2 * Math.PI;
//
//     // 绘制环底色
//     ctx.beginPath();
//     ctx.arc(centerX, centerY, radius, 0, 2 * Math.PI);
//     ctx.lineWidth = 20; // 圆环宽度
//     ctx.strokeStyle = '#e0e0e0'; // 底色
//     ctx.stroke();
//
//     // 绘制已支出部分
//     ctx.beginPath();
//     ctx.arc(centerX, centerY, radius, 0, spentAngle);
//     ctx.strokeStyle = '#ff6347'; // 红色
//     ctx.stroke();
//
//     // 绘制剩余部分
//     ctx.beginPath();
//     ctx.arc(centerX, centerY, radius, spentAngle, 2 * Math.PI);
//     ctx.strokeStyle = '#32cd32'; // 绿色
//     ctx.stroke();
//
//     // 绘制中间的文字
//     ctx.fillStyle = 'black';
//     ctx.font = '20px Arial';
//     ctx.fillText(`${this.spent}/${this.budget}`, centerX - 40, centerY + 5); // 文本居中
//   }
// }
