
alter PROCEDURE [AddEditCustomer]
	(

	@UserID int,
	@CustID int,
	@isActive bit,
	@UpdaterID int

)
AS
BEGIN
	if exists(select 1
	from [trn_user_customer_map]
	where userid=@UserID)
	begin
		update [trn_user_customer_map] set 
	UpdatedDate=getdate(),
	CustID = @CustID,
	UpdatedBy = @UpdaterID,
	isActive = @isActive
	where UserID = @UserID
	end
	else
	begin
		insert into [trn_user_customer_map]
			(UserID,CustID,isActive,UpdatedDate,UpdatedBy)
		values
			(@UserID, @CustID, @isActive, getdate(), @UpdaterID)
	end
END




create PROCEDURE [AddEditReporting]
	(

	@UserID int,
	@ReportingID int,
	@isActive bit,
	@UpdaterID int

)
AS
BEGIN
	if exists(select 1
	from [trn_user_reporting]
	where userid=@UserID)
	begin
		update [trn_user_reporting] set 
	UpdatedDate=getdate(),
	ReportingID = @ReportingID,
	UpdatedBy = @UpdaterID,
	isActive = @isActive
	where UserID = @UserID
	end
	else
	begin
		insert into [trn_user_reporting]
			(UserID,ReportingID,isActive,UpdatedDate,UpdatedBy)
		values
			(@UserID, @ReportingID, @isActive, getdate(), @UpdaterID)
	end
END




select *
from mst_user_dtl

select *
from trn_user_aty_rights
select *
from trn_user_customer_map
select *
from trn_user_role_mapp
select *
from trn_user_sub_role
select *
from trn_user_reporting

