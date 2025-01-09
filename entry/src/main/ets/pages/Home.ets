/*
 * 本页需要完成的是环形图的绘制、
 * 参数传入结构体
 * 数据存储到后端
 * 正确渲染明细*/

/*
 * 主要是数据的传递、
 * 数据的存储、
 * 点击交互
 * 环形图的绘制*/

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
      BudgetRing()
        // .width('100%')
        .layoutWeight(4)

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
            ExpenditureDetails()

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
  build() {
    Row() {
      Text("早餐")
        .fontSize(20)
      Row() {
        Text("#生活")
          .fontSize(20)
          .margin({right : 15})
          .fontColor(Color.Orange)
        Text("-9.0")
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
struct BudgetRing {
  @Prop budget : number = 0;
  @Prop expenditure : number = 0;
  @State totalExpenditure : number = 0
  build() {
    Stack(){
      Canvas()// 绘制环形图
        .width('100%')
        .height('100%')
      Image($r('app.media.ic_files_presentation_drive'))
        .height(20)
        .width(20)
        .align(Alignment.TopStart)
        .padding({
          top : 0,
          left : 0
        })
        .onClick(()=>{
          // 弹出输入框设置预算
        })
    }
    .width('100%')
    .backgroundColor(Color.Gray)
    // .height()
  }
}