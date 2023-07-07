-- Create a list of staging commands to translate SQL commandes that modifies data type and column name 

with source as (
    select * from {{ source('main','yellow_tripdata') }}

),
renamed as (
    select 
        VendorID as vendor_id,
        tpep_pickup_datetime as meter_engaged_dt,
        tpep_dropoff_datetime as meter_disengaged_dt,
        cast(store_and_fwd_flag as boolean) as store_fwd_flag,
        cast(RatecodeID as int) as rate_code_id,
        PUlocationID as pick_up_loc_id,
        DOlocationID as drop_off_loc_id,
        Passenger_count as passenger_count,
        trip_distance,
        fare_amount,
        extra as extra_amount,
        mta_tax,
        tip_amount,
        tolls_amount,
        improvement_surcharge,
        total_amount,
        cast(payment_type as int) as payment_type,
        airport_fee,
        congestion_surcharge,
        filename
    from source
)

select * from renamed