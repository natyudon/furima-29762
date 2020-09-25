class CreateSnsCredentials < ActiveRecord::Migration[6.0]
  def change
    create_table :sns_credentials do |t|
      t.string :provider     
      t.string :uid
      t.references :user, foreign_key: true
      t.timestamps
  #:provider,:uidはnull: falseの記述はしないアソシエーションを組んでて
  #sns認証を使わずにユーザー登録する人もいるためユーザー登録する際にnull: falseを
  #指定しているとこのカラム入ってないとエラーになる可能性あるから
    end
  end
end
