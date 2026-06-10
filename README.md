# PeakPick Catalog Service

Catalog Service là microservice quản lý danh mục sản phẩm cho demo PeakPick.

## Database Riêng

Service này sở hữu database `peakpick_catalog` với bảng:

- `products`

## Trách Nhiệm

- Trả danh sách sản phẩm.
- Quản lý tên, loại, giá, trạng thái bán và thời gian chuẩn bị.
- Không xử lý tồn kho thực tế hoặc checkout.

## Chạy Local

```bash
pip install -r requirements.txt
uvicorn services.catalog_service.main:app --reload --port 8001
```
