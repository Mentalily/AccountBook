/*
 * 本页需要完成的是：
 * 数据显示、柱形图的绘制
 */

import {CustomContentDialog, router } from '@kit.ArkUI'

interface AccountBookList {
  name: string;
  expense: number;
  income: number
}

@Entry
@Component
struct AccountBooksPreview {

  @State inputText: string = ''
  @State books: AccountBookList[] = []

  @Builder
  buildContent() : void {
    Column({space : 10}) {
      TextInput({
        placeholder : "输入账本名（也即tag）",
        text : this.inputText
      })
        .onChange((text: string) =>{
          this.inputText = text
        })
    }
  }

  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomContentDialog({
      contentBuilder: ()=> {
        this.buildContent()
      },
      buttons: [{value : "Cancel", buttonStyle: ButtonStyleMode.NORMAL, action: ()=>{
        this.inputText = ''
      }}, {value : "Confirm", buttonStyle: ButtonStyleMode.EMPHASIZED, action: () => {

        this.books.push({name: this.inputText, expense: 0, income: 0})
        // 清空输入框内容
        this.inputText = "";
      }}]
    })
  })

  build() {
    Column() {
      // 顶部导航栏
      Row() {
        Image($r('app.media.ic_public_arrow_left'))
          .width($r('app.float.arrow_left_width'))
          .margin({left : $r('app.float.arrow_left_margin')})
          .onClick(()=>{
            router.back()
          })
        Text("账本总览")
          .fontSize($r('app.float.top_navigation_text_fontsize'))
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
      .justifyContent(FlexAlign.SpaceBetween)
      .backgroundColor(Color.White)

      // 涉及到路由传参的知识点
      // 数据显示区
      Column({space : 20}){
        Text("这里其实有个饼图，但是还没来得及实现orz")
          .fontSize(20)
          .lineHeight(25)
          .textAlign(TextAlign.Center)
        Text("原计划这里展现每个账本的支出占比")
          .fontSize(20)
      }
      .justifyContent(FlexAlign.Center)
      .border({
        width : {
          bottom : 2
        }
      })
      .width('100%')
      .layoutWeight(4)

      Row() {
        Text('账本：')
          .fontSize($r('app.float.title_font_size'))
          .fontWeight(FontWeight.Bold)
        Image($r('app.media.ic_public_add_norm'))
          .width($r('app.float.add_icon_width'))
          .onClick(()=>{
            this.dialogController.open()
          })
      }
      .width('100%')
      .height($r('app.float.title_height'))
      .justifyContent(FlexAlign.SpaceBetween)
      .padding({
        left : $r('app.float.title_padding'),
        right : $r('app.float.title_padding')
      })
      .backgroundColor(Color.White)

      Scroll(){
        Column(){
          if (this.books.length != 0) {
            ForEach(this.books, (book: AccountBookList) => {
              AccountBook({
                bookName: book.name,
                expense: book.expense,
                income: book.income
              })
            })
          }
        }
        .width('90%')
      }
      .backgroundColor(Color.White)
      .layoutWeight(5)
      .width('100%')
      .scrollBar(BarState.Off)
      .align(Alignment.Top)

      // 底部导航栏
      Row() {
        // 账本区
        Image($r('app.media.ic_public_albums_filled'))
          .width($r('app.float.navigation_icon_width'))
          .margin({left : $r('app.float.bottom_navigation_margin')})
          .fillColor($r('app.color.accountbook_fill'))
        // 明细区
        Image($r('app.media.ic_public_add_norm'))
          .width($r('app.float.navigation_icon_width'))
          .onClick(()=>{
            router.pushUrl({
              url : 'pages/Home'
            })
          })
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
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor(Color.White)
  }
}

// 利用Navigation进入账本详情页
// @Preview

@Component
struct AccountBook {
  @Prop bookName: string
  @Prop expense: number
  @Prop income: number
  // @Prop onClick: (event?: ClickEvent) => void

  build() {
    Row() {
      Image($r('app.media.userPic'))
        .width(40)
        .borderRadius(20)
        .margin({
          right : 20
        })
      Text(this.bookName)
        .fontSize($r('app.float.item_font_size'))
      Blank()
      Column(){
        Text("支出：" + this.expense)
          .fontColor(Color.Red)
          .fontSize(15)
        Text("收入：" + this.income)
          .fontColor(Color.Green)
          .fontSize(15)
      }
    }
    .width('100%')
    .height($r('app.float.item_height'))
    .backgroundColor(Color.White)
    .border({
      width : $r('app.float.item_border_width')
    })
    .borderRadius($r('app.float.item_border_radius'))
    .padding({
      left : $r('app.float.item_padding'),
      right : $r('app.float.item_padding')
    })
    .margin({
      bottom : 5
    })
    .onClick(()=>{
      router.pushUrl({
        url: 'pages/AccountBookDetails',
        params: { bookName: this.bookName }
      })
    })
  }
}


// @Component
// struct DataShowPie {
//   build() {
//     Column(){
//
//     }
//     // .height()
//   }
// }