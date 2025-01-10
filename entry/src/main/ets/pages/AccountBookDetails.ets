import { router } from '@kit.ArkUI'

interface RouteParams {
  bookName: string;
}


@Entry
@Component
struct AccountBookDetails {
  @State bookName: string = '账本示例'

  onPageShow(): void {
    const params = router.getParams() as RouteParams
    this.bookName = params.bookName || 'Unknown';
  }

  build() {
    Column(){
      // 顶端导航栏
      Row() {
        Image($r('app.media.ic_public_arrow_left'))
          .width($r('app.float.arrow_left_width'))
          .margin({left : $r('app.float.arrow_left_margin')})
          .onClick(()=>{
            router.back()
          })
        Text(this.bookName)
          .fontSize($r('app.float.top_navigation_text_fontsize'))
        Image($r('app.media.ic_public_share'))
          .width($r('app.float.navigation_icon_width'))
          .margin({right : $r('app.float.top_navigation_margin')})
      }
      .height($r('app.float.top_navigation_bar_height'))
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .border({
        width : {
          top : $r('app.float.top_navigation_bar_border_width'),
          bottom : $r('app.float.top_navigation_bar_border_width')
        }
      })
      .backgroundColor(Color.White)
      // 数据显示
      Scroll() {
        Column() {
          DataShowBar()
            .layoutWeight(4)

          Row() {
            Column() {
              Text("支出：")
                .fontColor(Color.Red)
                .fontSize($r('app.float.title_font_size'))
                .textAlign(TextAlign.Start)
            }
            .justifyContent(FlexAlign.Start)
            .width('50%')
            .height('100%')
            .border({
              width : {
                right : 1
              }
            })
            Column() {
              Text("收入：")
                .fontColor(Color.Green)
                .fontSize($r('app.float.title_font_size'))
                .textAlign(TextAlign.Start)
            }
            .justifyContent(FlexAlign.Start)
            .width('50%')
            .height('100%')
            .border({
              width : {
                left : 1
              }
            })
          }
          .layoutWeight(5)
        }
      }
      .width('100%')
      .layoutWeight(1)




      // 底部导航栏
      Row() {
        Image($r('app.media.ic_public_albums_filled'))
          .width(30)
          .margin({left : 10})
          .fillColor($r('app.color.accountbook_fill'))
        Image($r('app.media.ic_public_add_norm'))
          .width(30)
        Image($r('app.media.ic_public_contacts'))
          .width(30)
          .margin({right : 10})
      }
      .width('100%')
      .height(45)
      .border({
        width : {
          top : 2,
          bottom : 2
        },
        color : {
          top : Color.Black,
          bottom : Color.Black
        }
      })
      .justifyContent(FlexAlign.SpaceBetween)
      .backgroundColor(Color.White)
    }

  }
}

@Component
struct DataShowBar {
  build() {
    Column(){
      Text("这里预期是按照时间呈现的柱状图，虽然也没来得及……")
        .fontSize(20)
        .lineHeight(25)
        .textAlign(TextAlign.Center)
    }
    .height('100%')
    .width('100%')
    .border({
      width : {
        bottom : 2
      }
    })
    .borderStyle(BorderStyle.Dotted)
    .padding(20)
  }
}