--Q1 患者名が「鈴木花子」である患者の、最も新しい診察記録の診察ID、診察日、医師名、診療科名を表示するSQL文を作成してください。
select
    s.examination_id
    , s.examination_date
    , d.doctor_name
    , dp.department_name 
from
    examinations s join patients p 
        on s.patient_id = p.patient_id join doctors d 
        on s.doctor_id = d.doctor_id join departments dp 
        on d.department_id = dp.department_id 
where
    p.patient_name = '鈴木花子' 
order by
    s.examination_date desc 
limit
    1; 

--Q2 各診療科ごとに診察回数を集計して、診療科名と診察回数を降順で表示するSQL文を作成してください。
select
    departments.department_name, count(*) as count 
from
    examinations 
    inner join departments 
        on examinations.department_id = departments.department_id 
group by
    departments.department_name 
order by
    count desc; 

--Q3 医師名が「山田一郎」である患者のIDと患者名を表示するSQL文を作成してください。
select
    patients.patient_id
    , patients.patient_name 
from
    patients 
    inner join examinations 
        on patients.patient_id = examinations.patient_id 
    inner join doctors 
        on examinations.doctor_id = doctors.doctor_id 
where
    doctors.doctor_name = '山田一郎'; 

--Q4 診療科が「内科」かつ診察日が2022年4月1日以降である患者の患者名と診察日を昇順で表示するSQL文を作成してください。
select
    patients.patient_name
    , examinations.examination_date 
from
    patients 
    inner join examinations 
        on patients.patient_id = examinations.patient_id 
    inner join departments 
        on examinations.department_id = departments.department_id 
where
    departments.department_name = '内科' 
    and examinations.examination_date >= '2022-04-01' 
order by
    examinations.examination_date desc; 

--Q5 医師名が「田中三郎」である診察記録の診察IDと診察日を表示するSQL文を作成してください。
select
    examinations.examination_id
    , examinations.examination_date 
from
    examinations 
    inner join doctors 
        on examinations.doctor_id = doctors.doctor_id 
where
    doctors.doctor_name = '田中三郎'; 

--Q6 examinationsテーブルから重複を除いた患者(patient_id)の数のSQL文を作成してください。
select
    count(distinct patient_id) 
from
    examinations; 

--Q7 department_idが2の科(department)における重複を除いた患者(patient_id)の数のSQL文を作成してください。
select
    count(distinct patient_id) 
from
    examinations 
where
    department_id = 2; 

--Q8 patient_nameが"山田太郎"の患者の情報を取得するクエリを書いてください。
select
    * 
from
    patients 
where
    patient_name = '山田太郎'; 

--Q9 2022年1月1日以降に診察された全ての情報を取得するクエリを書いてください。
select
    * 
from
    examinations 
where
    examination_date >= '2022-01-01'; 

--Q10 patientsテーブルから、patient_idが偶数でかつがgenderは男性の患者の名前を取得するSQL文を作成してください。
select
    patient_id
    , gender 
from
    patients 
where
    patient_id % 2 = 0 
    and gender = '男性'; 

--Q11 doctorsテーブルから、salaryが400000以上でかつgenderが'女性'の医師のIDと名前を取得するSQL文を作成してください。
select
    doctor_id
    , doctor_name 
from
    doctors 
where
    salary >= 400000 
    and gender = '女性'; 

--Q12 department_idが1または2の患者の治療データを取得するSQL文を作成してください。
select
    * 
from
    examinations 
where
    department_id = 1 
    or department_id = 2; 

--Q13 患者のIDが6以上で、診断結果が"糖尿病"または"高血圧"である診断データを取得するSQL文を作成してください。
select
    * 
from
    examinations 
where
    patient_id = 6 
    and (diagnosis = '糖尿病' or diagnosis = '高血圧'); 

--Q14 patient_idが3または4の場合で、かつ、diagnosisに"急性中耳炎"または"風邪"が含まれるレコードを抽出するSQL文を作成してください。
select
    * 
from
    examinations 
where
    (patient_id = 3 or patient_id = 4) 
    and ( 
        diagnosis like '%急性中耳炎%' 
        or diagnosis like '%風邪%'
    ); 

--Q15 patient_idが5で、かつ、(doctor_idが8であるか、department_idが4である)、かつ、examination_dateが2022年11月05日より後のレコードを抽出するSQL文を作成してください。
select
    * 
from
    examinations 
where
    patient_id = 5 
    and ( 
        (doctor_id = 8 or department_id = 4) 
        and examination_date > '2022-11-05'
    ); 

--Q16 examination_dateを昇順で並べ替えた結果を取得するSQL文を書いてください。
select
    * 
from
    examinations 
order by
    examination_date desc; 

--Q17 diagnosisが"風邪"のレコードをtreatmentの降順で並べ替えた結果を取得するSQL文を書いてください。
select
    * 
from
    examinations 
where
    diagnosis = '風邪' 
order by
    treatment desc; 

--Q18 最初の5つの患者のIDと名前を取得するSQL文を書いてください。
select
    patient_id
    , patient_name 
from
    patients 
limit
    5; 

--Q19 患者の診察データで、診断が「風邪」となっている最初の10件のデータを取得するSQL文を書いてください。
select
    * 
from
    examinations 
where
    diagnosis = '風邪' 
limit
    10; 

--Q20 examinationsテーブルから、患者IDが1であるデータのうち、最も古い日付であるexamination_dateで並び替えた上で、2番目のレコードから4つのレコードを取得してください。
select
    * 
from
    examinations 
where
    patient_id = 11 
order by
    examination_date desc 
limit
    3 offset 1;
    
    
--再練習--


--Q1 患者名が「鈴木花子」である患者の、最も新しい診察記録の診察ID、診察日、医師名、診療科名を表示するSQL文を作成してください。
select
    s.examination_id
    , s.examination_date
    , d.doctor_name
    , dp.department_name 
from
    examinations s join patients p 
        on s.patient_id = p.patient_id join doctors d 
        on s.doctor_id = d.doctor_id join departments dp 
        on d.department_id = dp.department_id 
where
    p.patient_name = '鈴木花子' 
order by
    s.examination_date desc 
limit
    1; 

--Q2 各診療科ごとに診察回数を集計して、診療科名と診察回数を降順で表示するSQL文を作成してください。
select
    departments.department_name, count(*) as count 
from
    examinations 
    inner join departments 
        on examinations.department_id = departments.department_id 
group by
    departments.department_name 
order by
    count desc; 

--Q3 医師名が「山田一郎」である患者のIDと患者名を表示するSQL文を作成してください。
select
    patients.patient_id
    , patients.patient_name 
from
    patients 
    inner join examinations 
        on patients.patient_id = examinations.patient_id 
    inner join doctors 
        on examinations.doctor_id = doctors.doctor_id 
where
    doctors.doctor_name = '山田一郎'; 

--Q4 診療科が「内科」かつ診察日が2022年4月1日以降である患者の患者名と診察日を昇順で表示するSQL文を作成してください。
select
    patients.patient_name
    , examinations.examination_date 
from
    patients 
    inner join examinations 
        on patients.patient_id = examinations.patient_id 
    inner join departments 
        on examinations.department_id = departments.department_id 
where
    departments.department_name = '内科' 
    and examinations.examination_date >= '2022-04-01' 
order by
    examinations.examination_date desc; 

--Q5 医師名が「田中三郎」である診察記録の診察IDと診察日を表示するSQL文を作成してください。
select
    examinations.examination_id
    , examinations.examination_date 
from
    examinations 
    inner join doctors 
        on examinations.doctor_id = doctors.doctor_id 
where
    doctors.doctor_name = '田中三郎'; 

--Q6 examinationsテーブルから重複を除いた患者(patient_id)の数のSQL文を作成してください。
select
    count(distinct patient_id) 
from
    examinations; 

--Q7 department_idが2の科(department)における重複を除いた患者(patient_id)の数のSQL文を作成してください。
select
    count(distinct patient_id) 
from
    examinations 
where
    department_id = 2; 

--Q8 patient_nameが"山田太郎"の患者の情報を取得するクエリを書いてください。
select
    * 
from
    patients 
where
    patient_name = '山田太郎'; 

--Q9 2022年1月1日以降に診察された全ての情報を取得するクエリを書いてください。
select
    * 
from
    examinations 
where
    examination_date >= '2022-01-01'; 

--Q10 patientsテーブルから、patient_idが偶数でかつがgenderは男性の患者の名前を取得するSQL文を作成してください。
select
    patient_id
    , gender 
from
    patients 
where
    patient_id % 2 = 0 
    and gender = '男性'; 

--Q11 doctorsテーブルから、salaryが400000以上でかつgenderが'女性'の医師のIDと名前を取得するSQL文を作成してください。
select
    doctor_id
    , doctor_name 
from
    doctors 
where
    salary >= 400000 
    and gender = '女性'; 

--Q12 department_idが1または2の患者の治療データを取得するSQL文を作成してください。
select
    * 
from
    examinations 
where
    department_id = 1 
    or department_id = 2; 

--Q13 患者のIDが6以上で、診断結果が"糖尿病"または"高血圧"である診断データを取得するSQL文を作成してください。
select
    * 
from
    examinations 
where
    patient_id = 6 
    and (diagnosis = '糖尿病' or diagnosis = '高血圧'); 

--Q14 patient_idが3または4の場合で、かつ、diagnosisに"急性中耳炎"または"風邪"が含まれるレコードを抽出するSQL文を作成してください。
select
    * 
from
    examinations 
where
    (patient_id = 3 or patient_id = 4) 
    and ( 
        diagnosis like '%急性中耳炎%' 
        or diagnosis like '%風邪%'
    ); 

--Q15 patient_idが5で、かつ、(doctor_idが8であるか、department_idが4である)、かつ、examination_dateが2022年11月05日より後のレコードを抽出するSQL文を作成してください。
select
    * 
from
    examinations 
where
    patient_id = 5 
    and ( 
        (doctor_id = 8 or department_id = 4) 
        and examination_date > '2022-11-05'
    ); 

--Q16 examination_dateを昇順で並べ替えた結果を取得するSQL文を書いてください。
select
    * 
from
    examinations 
order by
    examination_date desc; 

--Q17 diagnosisが"風邪"のレコードをtreatmentの降順で並べ替えた結果を取得するSQL文を書いてください。
select
    * 
from
    examinations 
where
    diagnosis = '風邪' 
order by
    treatment desc; 

--Q18 最初の5つの患者のIDと名前を取得するSQL文を書いてください。
select
    patient_id
    , patient_name 
from
    patients 
limit
    5; 

--Q19 患者の診察データで、診断が「風邪」となっている最初の10件のデータを取得するSQL文を書いてください。
select
    * 
from
    examinations 
where
    diagnosis = '風邪' 
limit
    10; 

--Q20 examinationsテーブルから、患者IDが1であるデータのうち、最も古い日付であるexamination_dateで並び替えた上で、2番目のレコードから4つのレコードを取得してください。
select
    * 
from
    examinations 
where
    patient_id = 11 
order by
    examination_date desc 
limit
    3 offset 1;


