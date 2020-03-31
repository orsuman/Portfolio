# Portfolio

## サイト概要
<誰にも言い出せない悩みを匿名で投稿し、弁護士先生などがその相談に乗ったり、実際に先生の事務所に来所して頂くところまでをサポートします。>

### サイトテーマ
<弁護士が法律で解決する掲示板>

### テーマを選んだ理由
< まずは、私が法学部出身(一応、学年で上位３%に該当する成績優秀者を獲得したこと有り)なので、それに関連づいたテーマにしようと考えました。
　そして日本においては、弁護士(司法書士、行政書士、税理士)といった士業の方々の仕事が少ないです。せっかく勉強して資格を取得しているのに、その資格を充分に仕事に生かせられない先生が多いと考えております。
　例えば米国社会では、コーヒーが熱かったという事例でもすぐに裁判が起きておりますが、日本では現状、裁判を起こす方は非常に少ないです。また、性犯罪や軽犯罪の被害に遭われた方が周りに相談できずに、そのままにせざるを得ないケースも多いです。
　弁護士がそういった事例を救済する為の仕事を増やせる、被害者も気軽に相談できるといった双方のニーズがマッチできるのではと思い、このサイトの制作に至りました。>

### ターゲットユーザ
<法的被害に遭ったけれども身近に相談できる人がいない方や、若しくは性犯罪など身近の方に相談しにくい事例を抱えている方、或いは法律事務所に行く程の事例か悩んでいる場合に気軽に質問したい方に向いています。>

### 主な利用シーン
<上記にもありますが、身近な人に相談しにくい事例や、軽犯罪被害に遭ったけどどうすれば良いのかわからない方が、この質問サイトで匿名で相談することができます。>

## 設計書

<ER図　https://drive.google.com/file/d/1vjrIjlhdsnOZU5pv6quy2NgiLeZfnqVi/view?usp=sharing>

<✨Admin（サイト管理者）
・カテゴリー管理
・ユーザー管理 ･･･ 強制退会制度、悪質な質問を削除
・コメント管理 ･･･ 悪質なコメントを削除

✨Lawyers（有料制）
・devise登録 ･･･ メールアドレス、パスワード、名前、職業、性別、プロフィール、クレジットカード、事務所の地域（郵便番号、県、その他住所）、退会ステータス
・Usersに対してコメントする
・Userからのチャットに応える


✨Users（無料制）
・devise登録 ･･･ メールアドレス、パスワード、名前、ニックネーム、年齢、地域（県、市）、退会ステータス
・Lawyerに質問の投稿をする
・Lawyerにチャットをする
・Lawyerのコメントに対して、参考になったボタンをクリックできる

🎮コントローラー
・悩み事投稿(Trouble)
・コメント(Comment)
・参考になった(Reference)
・カテゴリー(Category)
・ユーザー登録(Devise)
・チャット機能(chat)
・記事(Article)

📦カラム
・Devise(Admin) ･･･ :id_name, :passwordをseedで設定（登録画面は非表示！！）,:mail
・Devise(Lawyers) ･･･ :mail, :password, :name, :name_kana, :profession, :sex, :profile, :credit_number, :credit_month, :credit_year, :credit_name, :postal_code, :prefecture, :address, :profile_image, :deleted_at
・Devise(Users) ･･･ :mail, :password, :name, :name_kana, :nickname, :age, :prefecture, :city, :profile_image, :deleted_at
・Trouble ･･･ :title, :body, :category_id, :image_id
・Comment ･･･ :title, :comment
・Reference ･･･ :reference
・Article ･･･ :title, :body, :image_id
・Category ･･･ :name, :is_active
・Chat ･･･ :room, :user

🖥ページ(アクション)
・Home ･･･ top(ログイン画面誘導)
・Devise(Admin) ･･･ sign_inのみ
・Devise(L&U) ･･･ sign_in, sign_up, withdraw, sign_out, registration(edit)
・Admin
　　Admin ･･･ index(About。管理者からのお願いと併せたもの)
　　Category ･･･ index, edit, create, update
　　Users ･･･ index, show, edit, update
   Trouble ･･･ index, show, edit, desteroy
　　Lawyers ･･･ index, show, edit, update
　　Comment ･･･ index, edit, destroy
・Lawyers
　　Trouble ･･･ index, show
　　Lawyers ･･･ show, edit, withdraw, update, destroy
　　Users ･･･　show
　　Comment ･･･ create, edit, update, destroy
　　Article ･･･ index, new, show, edit, creat, update

・Users
　　Trouble ･･･ index, show, new, edit, create, update
　　Lawyers ･･･ show
　　Users ･･･ show, edit, withdraw, update, destroy
　　Article ･･･ index, show
　　Reference ･･･ Article, Commentへ create, destroy
   Chat room  >

### 機能一覧
<https://docs.google.com/spreadsheets/d/1wjvZuUAIdml-vEE73Jd0cJARbH-wJyIR3sAC7rD0X1g/edit?usp=sharing>


