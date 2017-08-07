<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container-fluid">
	<div class="row">
		<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
			<div id="DetailImgSlide" class="carousel slide" data-ride="carousel" data-interval="false">
				<div class="row vertical-align">
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-5">
						<ul class="list-group">
							<li data-target="#DetailImgSlide" data-slide-to="0" class="list-group-item active">
								<img src='<c:url value="/resources/${pcImg.getThumbnailImg().get(0)}"/>' alt="" class="center-block">
							</li>
							<c:forEach begin="1" end="${pcImg.getThumbnailImg().size() - 1}" var="i">
								<li data-target="#DetailImgSlide" data-slide-to="${i}" class="list-group-item">
									<img src='<c:url value="/resources/${pcImg.getThumbnailImg().get(i)}"/>' alt="" class="center-block">
								</li>
							</c:forEach>
						</ul>
					</div>
					<div class="col-lg-8 col-md-8 col-sm-8 col-xs-7">
						<!-- Wrapper for slides -->
						<div class="carousel-inner">
							<div class="item active">
								<img src='<c:url value="/resources/${pcImg.getPcImg().get(0)}"/>' alt="상세 이미지" class="img-responsive">
							</div>
							<c:forEach begin="1" end="${pcImg.getPcImg().size() - 1}" var="i">
							<div class="item">
								<img src='<c:url value="/resources/${pcImg.getPcImg().get(i)}"/>' alt="상세 이미지" class="img-responsive">
							</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>	
		</div>
		<div class="col-lg-6 col-md-5 col-sm-6 col-xs-12">
			<img src='<c:url value="/resources/${pcImg.getBrandImg()}"/>' alt="브랜드 이미지" class="brandImg">

			<h2>
			<c:if test="${pcSummary.getSsdSpace() eq null}">
				<c:out value="${pcSummary.getPcBrand()} 데스크탑 컴퓨터 ${pcSummary.getCpuKind()}
				(${pcSummary.getCpuSpeed()}) ${pcSummary.getHddSpace()} HDD ${pcSummary.getGraphicKind()} ${pcSummary.getOsName() }" />
			</c:if> <c:if test="${pcSummary.getHddSpace() eq null}">
				<c:out value="${pcSummary.getPcBrand()} 데스크탑 컴퓨터 ${pcSummary.getCpuKind()}
				(${pcSummary.getCpuSpeed()}) ${pcSummary.getSsdSpace()} SSD ${pcSummary.getGraphicKind()} ${pcSummary.getOsName() }" />
			</c:if> 
			<c:if test="${!pc.getHddSpace() eq null && !pc.getSsdSpace() eq null}">
				<c:out value="${pcSummary.getPcBrand()} 데스크탑 컴퓨터 ${pcSummary.getCpuKind()}
				(${pcSummary.getCpuSpeed()}) ${pcSummary.getHddSpace()} HDD ${pcSummary.getSsdSpace()} SSD ${pcSummary.getGraphicKind()} ${pcSummary.getOsName()}" />
			</c:if>
			</h2>
			<ul class="list-unstyled">
				<li>
					<strong>등급 :</strong>
					<c:forEach begin="1" end="${pcSummary.getPcGrade() / 20}" step="1">
					<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					</c:forEach>
				</li>
				<li>
					<strong>재고:</strong>
					<fmt:formatNumber value="${pcSummary.getPcStock()}" />개
				</li>
				<li>
					<strong>CPU: </strong> 
					<c:out value="${pcSummary.getCpuKind()} ${pcSummary.getCpuName()} (${pcSummary.getCpuSpeed()})" />
				</li>
				<li>
					<strong>메모리: </strong> 
					<c:out value="${pcSummary.getMainBoardRamLimit()} ${pcSummary.getRamSpeed()}" />
				</li>
				<c:if test="${pcSummary.getSsdSpace() eq null}">
				<li>
						<strong>저장장치: </strong> 
						<c:out value="${pcSummary.getHddSpace()} HDD" />
				</li>
				</c:if>
				<c:if test="${pcSummary.getHddSpace() eq null}">
				<li>
					<strong>저장장치: </strong> 
					<c:out value="${pcSummary.getSsdSpace()} SSD" />
				</li>
				</c:if>
				<c:if test="${!pcSummary.getHddSpace() eq null && !pcSummary.getSsdSpace() eq null}">
				<li>
					<strong>저장장치: </strong> 
					<c:out value="${pcSummary.getHddSpace()} HDD" />
				</li>
				<li>
					<strong>저장장치: </strong> 
					<c:out value="${pcSummary.getSsdSpace()} SSD" />
				</li>
				</c:if>
				<li>
					<strong>그래픽 카드: </strong>
					${pcSummary.getGraphicKind()}
				</li>
				<li>
					<strong>용도: </strong>${pcSummary.getPcType()}
				</li>
			</ul>
		</div>
		<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
					<p class="h4 text-muted"> 가격: </p>
					<p class="h4 text-primary">
						<fmt:formatNumber value="${pcSummary.getPcPrice()}" />원
					</p>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
					<p class="h4 text-muted">예상 배송일: </p>
					<p class="h4 text-primary">
						${pcSummary.getDeliveryDate() }
					</p>
				</div>
			</div>
			<form class="form-horizontal">
				<div class="form-group">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="input-group">
							<span class="input-group-btn">
								<button type="button" class="btn btn-primary btn-number" disabled="disabled" data-type="minus" data-field="quant[1]">
									<span class="glyphicon glyphicon-minus"></span>
								</button>
							</span>
							<input type="text" name="quant[1]" class="form-control input-number" value="1" min="1">
							<span class="input-group-btn">
								<button type="button" class="btn btn-primary btn-number" data-type="plus" data-field="quant[1]">
									<span class="glyphicon glyphicon-plus"></span>
								</button>
							</span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<button type="submit" class="btn btn-success btn-block">장바구니에 담기</button>
					</div>
				</div>
				<div class="form-group">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<button type="submit" class="btn btn-danger btn-lg btn-block">주문하기</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="container">
		<!-- 
		<div class="wing-banner">
		    <div class="wing-wrap">
		        <div class="wing-title">
		            <span class="wing-title-text">최근 본 상품</span>
		        </div>
		        <div class="wing-recently-view">
		            <ul class="wing-recently-view-list">
		                <li class="wing-recently-prd"><img src="ShopImages/pcSummary.thump-1.jpg"></li>
		                <li class="wing-recently-prd"><img src="ShopImages/pcSummary.thump-1.jpg"></li>
		                <li class="wing-recently-prd"><img src="ShopImages/pcSummary.thump-1.jpg"></li>
		                <li class="wing-recently-prd"><img src="ShopImages/pcSummary.thump-1.jpg"></li>
		                <li class="wing-recently-prd"><img src="ShopImages/pcSummary.thump-1.jpg"></li>
		            </ul>
		        </div>
		    </div>
		</div>
		 -->
		<div class="table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
						<th colspan="2">싱품 모델 정보</th>
					</tr>
				</thead>
				<tbody>
					<!-- 브랜드명 -->
					<tr>
						<th>브랜드명</th>
						<td>${pcSummary.getPcBrand() }</td>
					</tr>
					<!-- 코드명 -->
					<tr>
						<th>코드명</th>
						<td>${pcSummary.getPcCode() }</td>
					</tr>
					<tr>
						<th>용도</th>
						<td>${pcSummary.getPcType()}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
						<th colspan="2">상품 상세 정보</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>CPU 이름</th>
						<td>${pcDetail.getCpuName() }</td>
					</tr>
					<tr>
						<th>CPU 타입</th>
						<td>${pcDetail.getCpuType() }</td>
					</tr>
					<tr>
						<th>메모리 용량</th>
						<td>${pcDetail.getMainBoardRamLimit() }</td>
					</tr>
					<tr>
						<th>메모리 속도</th>
						<td>${pcDetail.getRamSpeed() }</td>
					</tr>
					<c:if test="${pcDetail.getSsdSpace() eq null}">
						<tr>
							<th>HDD 용량</th>
							<td>${pcDetail.getHddSpace() }</td>
						</tr>
						<tr>
							<th>HDD 속도</th>
							<td>${pcDetail.getHddSpeed() }</td>
						</tr>
					</c:if>

					<c:if test="${pcDetail.getHddSpace() eq null}">
						<tr>
							<th>SSD 용량</th>
							<td>${pcDetail.getSsdSpace() }</td>
						</tr>
						<tr>
							<th>SSD 속도</th>
							<td>${pcDetail.getSsdSpeed() }</td>
						</tr>
					</c:if>

					<c:if test="${!pcDetail.getHddSpace() eq null && !pcDetail.getSsdSpace() eq null}">
						<tr>
							<th>HDD 용량</th>
							<td>${pcDetail.getHddSpace() }</td>
						</tr>
						<tr>
							<th>HDD 속도</th>
							<td>${pcDetail.getHddSpeed() }</td>
						</tr>
						<tr>
							<th>SSD 용량</th>
							<td>${pcDetail.getSsdSpace() }</td>
						</tr>
						<tr>
							<th>SSD 속도</th>
							<td>${pcDetail.getSsdSpeed() }</td>
						</tr>
					</c:if>
					<tr>
						<th>운영체제 이름</th>
						<td>${pcDetail.getOsName() }</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
						<th colspan="2">CPU 정보</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>브랜드</th>
						<td>${pcDetail.getCpuBrand() }</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${pcDetail.getCpuName() }</td>
					</tr>
					<tr>
						<th>속도</th>
						<td>${pcDetail.getCpuSpeed() }</td>
					</tr>
					<tr>
						<th>타입</th>
						<td>${pcDetail.getCpuType()}</td>
					</tr>
					<tr>
						<th>종류</th>
						<td>${pcDetail.getCpuKind() }</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
						<th colspan="2">메모리 정보</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>브랜드</th>
						<td>${pcDetail.getRamBrand() }</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${pcDetail.getRamName() }</td>
					</tr>
					<tr>
						<th>용량</th>
						<td>${pcDetail.getMainBoardRamLimit() }</td>
					</tr>
					<tr>
						<th>속도</th>
						<td>${pcDetail.getRamSpeed() }</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
						<th colspan="2">그래픽 카드 정보</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>브랜드</th>
						<td>${pcDetail.getGraphicBrand() }</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${pcDetail.getGraphicName() }</td>
					</tr>
					<tr>
						<th>종류</th>
						<td>${pcDetail.getGraphicKind() }</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="table-responsive">
			<c:if test="${pcDetail.getSsdSpace() eq null}">
			<table class="table table-striped">
				<thead>
					<tr>
						<th colspan="2">HDD 정보</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>브랜드</th>
						<td>${pcDetail.getHddBrand() }</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${pcDetail.getHddName() }</td>
					</tr>
					<tr>
						<th>용량</th>
						<td>${pcDetail.getHddSpace() }</td>
					</tr>
					<tr>
						<th>속도</th>
						<td>${pcDetail.getHddSpeed() }</td>
					</tr>
				</tbody>
			</table>
			</c:if>
		</div>
		<div class="table-responsive">
			<c:if test="${pcDetail.getHddSpace() eq null}">
			<table class="table table-striped">
				<thead>
					<tr>
						<th colspan="2">SSD 정보</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>브랜드</th>
						<td>${pcDetail.getSsdBrand() }</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${pcDetail.getSsdName() }</td>
					</tr>
					<tr>
						<th>용량</th>
						<td>${pcDetail.getSsdSpace() }</td>
					</tr>
					<tr>
						<th>속도</th>
						<td>${pcDetail.getSsdSpeed() }</td>
					</tr>
				</tbody>
			</table>
			</c:if>
		</div>
		<div class="table-responsive">
			<c:if test="${!pcDetail.getHddSpace() eq null && !pcDetail.getSsdSpace() eq null}">
			<table class="table table-striped">
				<thead>
					<tr>
						<th colspan="2">HDD 정보</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>브랜드</th>
						<td>${pcDetail.getHddBrand() }</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${pcDetail.getHddName() }</td>
					</tr>
					<tr>
						<th>용량</th>
						<td>${pcDetail.getHddSpace() }</td>
					</tr>
					<tr>
						<th>속도</th>
						<td>${pcDetail.getHddSpeed() }</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
						<th colspan="2">SSD 정보</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>브랜드</th>
						<td>${pcDetail.getSsdBrand() }</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${pcDetail.getSsdName() }</td>
					</tr>
					<tr>
						<th>용량</th>
						<td>${pcDetail.getSsdSpace() }</td>
					</tr>
					<tr>
						<th>속도</th>
						<td>${pcDetail.getSsdSpeed() }</td>
					</tr>
				</tbody>
			</table>
			</c:if>
		</div>
		<div class="table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
						<th colspan="2">메인보드 정보</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>브랜드</th>
						<td>${pcDetail.getMainBoardBrand() }</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${pcDetail.getMainBoardName() }</td>
					</tr>
					<tr>
						<th>램 슬롯</th>
						<td>${pcDetail.getMainBoardRamSlot() }개</td>
					</tr>
					<tr>
						<th>최대 메모리</th>
						<td>${pcDetail.getMainBoardRamLimit() }</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
						<th colspan="2">운영체제 정보</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>이름</th>
						<td>${pcDetail.getOsName() }</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
