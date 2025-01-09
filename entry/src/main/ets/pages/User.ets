/**
 * 本页也需要完成的是
 * 数据存储
 * 数据传递
 * 点击交互
 * 页面渲染倒是还好
 */
import { router } from '@kit.ArkUI'

@Entry
@Component
struct User {
  @State userName : string = "admin"
  @State sumAsset : number = 0
  @State countAsset : number = 0
  build() {
    Column() {
      // 顶部导航栏
      Row() {
        Image($r('app.media.ic_public_arrow_left'))
          .width($r('app.float.arrow_left_width'))
          .margin({
            left : $r('app.float.arrow_left_margin')
          })
          .onClick(()=>{
            router.back()
          })
        Text("你好，"+this.userName)
          .fontSize($r('app.float.top_navigation_text_fontsize'))

        Image($r('app.media.ic_public_settings'))
          .width($r('app.float.navigation_icon_width'))
          .margin({
            right : $r('app.float.top_navigation_margin')
          })
      }
      .width('100%')
      .height($r('app.float.top_navigation_bar_height'))
      .border({
        width : {
          top : $r('app.float.top_navigation_bar_border_width'),
          bottom : $r('app.float.top_navigation_bar_border_width')
        }
      })
      .justifyContent(FlexAlign.SpaceBetween)

      Column() {
        // 头像、壁纸
        Column() {
          Text("今天你记账了吗？")
            .fontSize(38)
            .textAlign(TextAlign.Center)
            .width('100%')
            .height(70)
            .border({
              width : {
                bottom : 2
              }
            })
            .backgroundColor(Color.White)

          Image($r('app.media.userPic'))
            .width(50)
            .border({
              width : 1
            })
            .borderRadius(25)
            .margin({
              top : -15
            })
        }
        .width('100%')
        .height(100)
        .margin({
          bottom : 10
        })

        // 正文
        Scroll() {
          Column()
          {
            // 总资产
            Row(){
              Text("总资产：" + this.sumAsset)
                .fontSize($r('app.float.title_font_size'))
                .fontWeight(FontWeight.Bold)
                .layoutWeight(1)
              Image($r('app.media.ic_public_add_norm'))
                .width($r('app.float.add_icon_width'))
            }
            .height($r('app.float.title_height'))
            .width('100%')
            .padding({
              left : $r('app.float.title_padding'),
              right : $r('app.float.title_padding')
            })
            AssetDetails()

          }

          .width('100%')

        }
        .scrollBar(BarState.Off)
      }
      .layoutWeight(1)
      .backgroundColor(Color.White)



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
        Image($r('app.media.ic_public_add_norm'))
          .width($r('app.float.navigation_icon_width'))
          .onClick(()=>{
            router.pushUrl({
              url : 'pages/Home'
            })
          })
        // 资产区
        Image($r('app.media.ic_public_contacts_filled'))
          .width($r('app.float.navigation_icon_width'))
          .margin({right : $r('app.float.bottom_navigation_margin')})
          .fillColor($r('app.color.user_fill'))
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
struct AssetDetails {
  build() {
    Row() {
      Text("银行卡1")
        .fontSize($r('app.float.item_font_size'))
      Text("6000")
        .fontSize($r('app.float.item_font_size'))
    }
    .height($r('app.float.item_height'))
    .width('90%')
    .borderRadius($r('app.float.item_border_radius'))
    .border({
      width : $r('app.float.item_border_width')
    })
    .padding({
      left : $r('app.float.item_padding'),
      right : $r('app.float.item_padding')
    })
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor(Color.White)
    .margin({
      bottom : 10
    })
  }
}

class AssetDetailsClass {
  id : string = "";
  name : string = "";
  num : number = 0;

  constructor(id: string, name: string, num: number) {
    this.id = id;
    this.name = name;
    this.num = num;
  }
}