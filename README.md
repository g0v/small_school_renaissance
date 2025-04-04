<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [關於這個專案](#%E9%97%9C%E6%96%BC%E9%80%99%E5%80%8B%E5%B0%88%E6%A1%88)
  - [現況](#%E7%8F%BE%E6%B3%81)
  - [緣起](#%E7%B7%A3%E8%B5%B7)
  - [終局](#%E7%B5%82%E5%B1%80)
- [如何貢獻](#%E5%A6%82%E4%BD%95%E8%B2%A2%E7%8D%BB)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## 關於這個專案

### 現況

搜羅、爬梳和預處理對「國民小學廢校預警」有意義的「開放資料」和「能爬取到的公開資料」中...

### 緣起

明錡與 [chewei][people_chewei] 在[台灣零時政府第陸拾陸次友愛青年黑客松][g0v_66_hackathon]提出了[廢校預警][g0v_md_note]專案，希望透過「學校就學人口變化趨勢推測」的方式做到廢校預警。

### 終局

待補...

## 如何貢獻

- 這個專案目前還沒進入到資料分析與視覺化的實作階段
- 盡量使用 bash 指令與 GNU project 指令
- 除非有不可替代性，否則維持第一項原則
- 盡量把資料處理成「機器可讀」的 `.csv` 檔案  
  👉 所以不寫程式把抓好的資料丟進 Excel 或是 BI 系統也能分析
- 未來在分析學區與人口的時候，預計會使用到 geospatial 相關技術，所以會使用下列社群的資源與技術成果
  - [OGC][gis_ogc]
  - [OSGeo][gis_osgeo]
  - [OSM][gis_osm]

[g0v_66_hackathon]: https://g0v.hackmd.io/@jothon/g0v-hackath66n/
[g0v_md_note]: https://g0v.hackmd.io/TG6CtrxyRdudWawzTXfPiw
[gis_ogc]: https://www.ogc.org
[gis_osgeo]: https://www.osgeo.org
[gis_osm]: https://www.openstreetmap.org/
[people_chewei]: https://github.com/cheweiliu
