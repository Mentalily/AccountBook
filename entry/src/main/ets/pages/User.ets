import { AlertDialog, CustomContentDialog, router } from '@kit.ArkUI'

interface AssetList {
  name: string;
  total: number;
}

@Entry
@Component
struct User {
  @State userName : string = "admin"
  @State sumAsset : number = 0
  // @State countAsset : number = 0
  @State inputText : string = ''
  @State inputText2: string = ''
  @State alertMessage : string = ""
  @State showAlert : boolean = false
  @State assets: AssetList[] = [];

  @Builder
  buildContent() : void {
    Column({space : 10}) {
      TextInput({
        placeholder : "资产[space]金额",
        text : this.inputText
      })
        .onChange((text: string) =>{
          this.inputText = text
        })
    }
  }

  @Builder
  buildContent2() : void {
    Column({space : 10}) {
      TextInput({
        placeholder : "用户名",
        text : this.inputText2
      })
        .onChange((text: string) =>{
          this.inputText2 = text
        })
    }
  }

  dialogController2: CustomDialogController = new CustomDialogController({
    builder: CustomContentDialog({
      contentBuilder: ()=>{
        this.buildContent2()
      },
      buttons:  [{value : "Cancel", buttonStyle: ButtonStyleMode.NORMAL, action: ()=> {
        this.inputText2 = ''
      }}, {value : "Confirm", buttonStyle: ButtonStyleMode.EMPHASIZED, action: () => {
          this.userName = this.inputText2
          this.inputText2 = ''
        }}]
      })

    })

  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomContentDialog({
      contentBuilder: ()=> {
        this.buildContent()
      },
      buttons: [{value : "Cancel", buttonStyle: ButtonStyleMode.NORMAL, action: ()=>{
        this.inputText = ''
      }}, {value : "Confirm", buttonStyle: ButtonStyleMode.EMPHASIZED, action: () => {

        const match = this.inputText.match(/^(\S+)\s+(\-?\d+(\.\d+)?)$/);
        if (!match) {
          console.log('erro' + this.inputText);
          this.alertMessage = "输入格式请参考输入框提示😊";
          this.showAlert = true;
          return;
        }

        // 提取解析结果
        const assetName: string = match[1].trim(); // 资产名字
        const amount: number = parseFloat(match[2]); // 数值

        if (isNaN(amount)) {
          this.alertMessage = "真的没有输错金额吗😣";
          this.showAlert = true;
          return;
        }

        // 累加总资产
        this.sumAsset += amount
        // 更新资产列表
        const existingAsset = this.assets.find(asset => asset.name === assetName);
        if (existingAsset) {
          // 如果资产已存在，则累加数值
          existingAsset.total += amount;
        } else {
          // 如果资产不存在，则添加新资产
          this.assets.push({ name: assetName, total: amount });
        }

        // 清空输入框内容
        this.inputText = "";
      }}]
    })
  })

  build() {
    Column() {
      Column() {
        // 顶部导航栏
        Row() {
          Image($r('app.media.ic_public_arrow_left'))
            .width($r('app.float.arrow_left_width'))
            .margin({
              left: $r('app.float.arrow_left_margin')
            })
            .onClick(() => {
              router.back()
            })
          Text("你好，" + this.userName)
            .fontSize($r('app.float.top_navigation_text_fontsize'))

          Image($r('app.media.ic_public_settings'))
            .width($r('app.float.navigation_icon_width'))
            .margin({
              right: $r('app.float.top_navigation_margin')
            })
            .onClick(()=>{
              router.pushUrl({
                url : 'pages/Login'
              })
            })
        }
        .width('100%')
        .height($r('app.float.top_navigation_bar_height'))
        .border({
          width: {
            top: $r('app.float.top_navigation_bar_border_width'),
            bottom: $r('app.float.top_navigation_bar_border_width')
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
                width: {
                  bottom: 2
                }
              })
              .backgroundColor(Color.White)

            Image($r('app.media.userPic'))
              .width(50)
              .border({
                width: 1
              })
              .borderRadius(25)
              .margin({
                top: -15
              })
              .onClick(()=>{
                this.dialogController2.open()
              })
          }
          .width('100%')
          .height(100)
          .margin({
            bottom: 10
          })

          // 总资产
          Row() {
            Text("总资产：" + this.sumAsset)
              .fontSize($r('app.float.title_font_size'))
              .fontWeight(FontWeight.Bold)
              .layoutWeight(1)
            Image($r('app.media.ic_public_add_norm'))
              .width($r('app.float.add_icon_width'))
              .onClick(() => {
                this.dialogController.open()
              })
          }
          .height($r('app.float.title_height'))
          .width('100%')
          .padding({
            left: $r('app.float.title_padding'),
            right: $r('app.float.title_padding')
          })

          if (this.showAlert) {
            AlertDialog({
              primaryTitle: "等等好像有点不对劲",
              content: this.alertMessage,
              primaryButton: {
                value: "Get!👌",
                action: () => {
                  this.showAlert = false;
                  this.inputText = ""
                }
              }
            })
          }
        }
      }

      Column(){
        Scroll() {
          Column() {
            if (this.assets.length != 0) {
              ForEach(this.assets, (asset: AssetList)=>{
                AssetDetails({
                  assetName: asset.name,
                  assetAmount: asset.total
                })
              })
            }
          }
          .justifyContent(FlexAlign.Start)
          .width('100%')
        }
        .align(Alignment.Top)
        .scrollBar(BarState.Off)
        .backgroundColor(Color.White)
        .layoutWeight(1)

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
      .width('100%')
      .layoutWeight(1)
    }
    .height('100%')
    .width('100%')
  }
}

// @Preview
@Component
struct AssetDetails {
  @Prop assetName: string
  @Prop assetAmount: number

  build() {
    Row() {
      Text(this.assetName)
        .fontSize($r('app.float.item_font_size'))
      Text(this.assetAmount.toString())
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

// Row() {
//   Button("Cancel")
//     .width('30%')
//     .backgroundColor($r('app.color.button_cancel'))
//     .onClick(()=>{
//
//     })
//   Button("Confirm")
//     .width('50%')
//     .backgroundColor($r('app.color.button_ok'))
//     .onClick(()=>{
//
//     })
// }
// .width('100%')
// .justifyContent(FlexAlign.SpaceBetween)