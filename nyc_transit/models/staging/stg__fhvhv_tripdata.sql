-- Create a list of staging commands to translate SQL commandes that modifies data type and column name 

with source as (
    select * from {{ source('main','fhvhv_tripdata') }}

),
renamed as (
    select 
        hvfhs_license_num  as license_num,
        dispatching_base_num as dispatch_base_num,
        originating_base_num as origin_base_num,
        request_datetime as request_dt,
        on_scene_datetime as on_scence_dt,
        pickup_datetime as pick_up_dt,
        dropOff_datetime as drop_off_dt,
        PUlocationID as pick_up_loc_id,
        DOlocationID as drop_off_loc_id,
        trip_miles,
        trip_time as trip_time_seconds,
        base_passenger_fare as base_fare,
        tolls,
        bcf as black_car_fund,
        sales_tax,
        congestion_surcharge,
        airport_fee,
        tips
        driver_pay,
        cast(shared_request_flag as boolean) as shared_request_flag,
        cast(shared_match_flag as boolean) as shared_match_flag,
        cast(access_a_ride_flag as boolean) as access_a_ride_flag,
        cast(wav_request_flag as boolean) as wav_request_flag,
        cast(wav_match_flag as boolean) as wav_match_flag,
        filename
    from source
)

select * from renamed
