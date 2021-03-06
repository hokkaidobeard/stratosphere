{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-spotfleet-spotfleetrequestconfigdata-launchspecifications-placement.html

module Stratosphere.ResourceProperties.EC2SpotFleetSpotPlacement where

import Control.Lens hiding ((.=))
import Data.Aeson
import Data.Maybe (catMaybes)
import Data.Monoid (mempty)
import Data.Text

import Stratosphere.Values


-- | Full data type definition for EC2SpotFleetSpotPlacement. See
-- 'ec2SpotFleetSpotPlacement' for a more convenient constructor.
data EC2SpotFleetSpotPlacement =
  EC2SpotFleetSpotPlacement
  { _eC2SpotFleetSpotPlacementAvailabilityZone :: Maybe (Val Text)
  , _eC2SpotFleetSpotPlacementGroupName :: Maybe (Val Text)
  } deriving (Show, Eq)

instance ToJSON EC2SpotFleetSpotPlacement where
  toJSON EC2SpotFleetSpotPlacement{..} =
    object $
    catMaybes
    [ fmap (("AvailabilityZone",) . toJSON) _eC2SpotFleetSpotPlacementAvailabilityZone
    , fmap (("GroupName",) . toJSON) _eC2SpotFleetSpotPlacementGroupName
    ]

instance FromJSON EC2SpotFleetSpotPlacement where
  parseJSON (Object obj) =
    EC2SpotFleetSpotPlacement <$>
      (obj .:? "AvailabilityZone") <*>
      (obj .:? "GroupName")
  parseJSON _ = mempty

-- | Constructor for 'EC2SpotFleetSpotPlacement' containing required fields as
-- arguments.
ec2SpotFleetSpotPlacement
  :: EC2SpotFleetSpotPlacement
ec2SpotFleetSpotPlacement  =
  EC2SpotFleetSpotPlacement
  { _eC2SpotFleetSpotPlacementAvailabilityZone = Nothing
  , _eC2SpotFleetSpotPlacementGroupName = Nothing
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-spotfleet-spotfleetrequestconfigdata-launchspecifications-placement.html#cfn-ec2-spotfleet-spotplacement-availabilityzone
ecsfspAvailabilityZone :: Lens' EC2SpotFleetSpotPlacement (Maybe (Val Text))
ecsfspAvailabilityZone = lens _eC2SpotFleetSpotPlacementAvailabilityZone (\s a -> s { _eC2SpotFleetSpotPlacementAvailabilityZone = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-spotfleet-spotfleetrequestconfigdata-launchspecifications-placement.html#cfn-ec2-spotfleet-spotplacement-groupname
ecsfspGroupName :: Lens' EC2SpotFleetSpotPlacement (Maybe (Val Text))
ecsfspGroupName = lens _eC2SpotFleetSpotPlacementGroupName (\s a -> s { _eC2SpotFleetSpotPlacementGroupName = a })
