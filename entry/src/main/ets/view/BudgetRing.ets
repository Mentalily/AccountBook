import fetch from '@system.fetch'
import { data } from '@kit.TelephonyKit'

@Entry
@Component

struct BudgetRing {
  @State chartUrl: string = ''


//   fetch : function () {
//     fetch.fetch({
//   url: 'http://127.0.0.1:5000/budget/chart',
//   method: 'GET',
//   responseType: 'json',
//   success: (data) => {
//     console.log('成功获取饼图数据:', data);
//
//   },
//   fail: (error, code) => {
//     console.error('获取饼图数据失败:', error, '错误代码:', code);
//   },
//   complete: () => {
//     console.log('饼图数据请求完成');
//   }
// })
// }
//
//
//   ({
//
//   })

  onPageShow(): void {
    this.chartUrl = ''
    fetch.fetch({
      url: "http://127.0.0.1:5000/budget/chart",
      method: 'GET',
      responseType: 'json',
      success: (data) => {

      },
      fail: (error: string, code) => {
        console.log('获取饼图数据失败:', error, '错误代码:', code)
      },
      complete: ()=> {
        console.log('饼图请求完成')
      }
    })
  }

  build() {

  }
}