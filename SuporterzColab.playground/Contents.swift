//-------------------------------
// オプショナル型
//-------------------------------
//var hoge : Int? = 114514
//print(hoge) // -> Optional(114514)

// -------------強制アンラップ--------------
// エラーパターン
//var hogehoge : String? = nil
//print(hogehoge!)

// 成功パターン
//var hogehoge : String? = nil
//hogehoge = "屋上あんだけど焼いてかない？"
//print(hogehoge!)

// ------------オプショナルバインディング--------------
// nilパターン
//var fuga : String? = nil
//if let unwrapfuga = fuga {
//    print("fugaの中身は\(unwrapfuga)")
//}
//else {
//    print("fugaにはnilが入っている")
//}

// nil以外のパターン
//var fuga : String? = nil
//fuga = "入って、どうぞ"
//if let unwrapfuga = fuga {
//    print("fugaの中身は\(unwrapfuga)")
//}
//else {
//    print("fugaにはnilが入っている")
//}

// ------------オプショナルチェイニング----------------
// 前提クラス
//class HogeHoge{
//    private var name : String = "yajuu"
//    public var Name : String {
//        get {
//            return self.name
//        }
//    }
//
//    public func IceTea() -> String{
//        return "おまたせ！アイスティーしかなかったけどいいかな？"
//    }
//}

// nilパターン
//var hogehoge : HogeHoge? = nil
//print(hogehoge?.Name)
//print(hogehoge?.IceTea())

// 成功パターン
//var hogehoge : HogeHoge? = HogeHoge()
//print(hogehoge?.Name)
//print(hogehoge?.IceTea())


//--------------------------------------
// 暗黙的アンラップ型
//--------------------------------------

// nilパターン
//class FugaFuga{
//    var a : Int!
//    var b : Int = 20
//
//    public func AddAandB() -> Int{
//        return a + b
//    }
//}
//
//var fugafuga = FugaFuga()
//print(fugafuga.AddAandB())

// 成功パターン
//class FugaFuga{
//    var a : Int!
//    var b : Int = 20
//
//    init(){
//        self.a = 30
//    }
//
//    public func AddAandB() -> Int{
//        return a + b
//    }
//}
//
//var fugafuga = FugaFuga()
//print(fugafuga.AddAandB())


//---------------------------------------
// willset/didset
//---------------------------------------

// 実装例
//var hoge:Int = 0 {
//    willSet(newValue){
//        print("nowValue:\(hoge), newValue:\(newValue)")
//    }
//    didSet(oldValue){
//        if(hoge < oldValue){
//            print("元の値より小さい値は代入できません。\(oldValue) -> \(hoge)")
//            hoge = oldValue // 値は変わる(この場合willset / didsetには通知されない)
//        }
//    }
//}

// コンピューテッドプロパティでやらかすパターン
//class HogeHoge{
//    private var hoge: Int = 0
//
//    public var Hoge: Int{
//        set{
//            print("nowValue:\(hoge), newValue:\(newValue)")
//            self.hoge = newValue
//        }
//        get{
//            return self.hoge
//        }
//    }
//
//    public func SetHogeValue(a:Int) -> Void{
//        self.hoge = a // 変数に直接アクセルしてしまっている
//    }
//}
//var hogehoge = HogeHoge()
//hogehoge.Hoge = 1
//hogehoge.SetHogeValue(a: 2) // こちらはプロパティ内の処理が実行されない


// プロパティ監視パターン
//class HogeHoge{
//
//    private var hoge: Int = 0 {
//        willSet(newValue){
//            print("nowValue:\(hoge), newValue:\(newValue)")
//        }
//    }
//
//    public var Hoge: Int{
//        set{
//            self.hoge = newValue
//        }
//        get{
//            return self.hoge
//        }
//    }
//
//    public func SetHogeValue(a:Int) -> Void{
//        self.hoge = a
//    }
//}
//var hogehoge = HogeHoge()
//hogehoge.Hoge = 1
//hogehoge.SetHogeValue(a: 2)

