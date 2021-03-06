{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-route53-hostedzone.html

module Stratosphere.Resources.Route53HostedZone where

import Control.Lens hiding ((.=))
import Data.Aeson
import Data.Maybe (catMaybes)
import Data.Monoid (mempty)
import Data.Text

import Stratosphere.Values
import Stratosphere.ResourceProperties.Route53HostedZoneHostedZoneConfig
import Stratosphere.ResourceProperties.Route53HostedZoneHostedZoneTag
import Stratosphere.ResourceProperties.Route53HostedZoneVPC

-- | Full data type definition for Route53HostedZone. See 'route53HostedZone'
-- for a more convenient constructor.
data Route53HostedZone =
  Route53HostedZone
  { _route53HostedZoneHostedZoneConfig :: Maybe Route53HostedZoneHostedZoneConfig
  , _route53HostedZoneHostedZoneTags :: Maybe [Route53HostedZoneHostedZoneTag]
  , _route53HostedZoneName :: Val Text
  , _route53HostedZoneVPCs :: Maybe [Route53HostedZoneVPC]
  } deriving (Show, Eq)

instance ToJSON Route53HostedZone where
  toJSON Route53HostedZone{..} =
    object $
    catMaybes
    [ fmap (("HostedZoneConfig",) . toJSON) _route53HostedZoneHostedZoneConfig
    , fmap (("HostedZoneTags",) . toJSON) _route53HostedZoneHostedZoneTags
    , (Just . ("Name",) . toJSON) _route53HostedZoneName
    , fmap (("VPCs",) . toJSON) _route53HostedZoneVPCs
    ]

instance FromJSON Route53HostedZone where
  parseJSON (Object obj) =
    Route53HostedZone <$>
      (obj .:? "HostedZoneConfig") <*>
      (obj .:? "HostedZoneTags") <*>
      (obj .: "Name") <*>
      (obj .:? "VPCs")
  parseJSON _ = mempty

-- | Constructor for 'Route53HostedZone' containing required fields as
-- arguments.
route53HostedZone
  :: Val Text -- ^ 'rhzName'
  -> Route53HostedZone
route53HostedZone namearg =
  Route53HostedZone
  { _route53HostedZoneHostedZoneConfig = Nothing
  , _route53HostedZoneHostedZoneTags = Nothing
  , _route53HostedZoneName = namearg
  , _route53HostedZoneVPCs = Nothing
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-route53-hostedzone.html#cfn-route53-hostedzone-hostedzoneconfig
rhzHostedZoneConfig :: Lens' Route53HostedZone (Maybe Route53HostedZoneHostedZoneConfig)
rhzHostedZoneConfig = lens _route53HostedZoneHostedZoneConfig (\s a -> s { _route53HostedZoneHostedZoneConfig = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-route53-hostedzone.html#cfn-route53-hostedzone-hostedzonetags
rhzHostedZoneTags :: Lens' Route53HostedZone (Maybe [Route53HostedZoneHostedZoneTag])
rhzHostedZoneTags = lens _route53HostedZoneHostedZoneTags (\s a -> s { _route53HostedZoneHostedZoneTags = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-route53-hostedzone.html#cfn-route53-hostedzone-name
rhzName :: Lens' Route53HostedZone (Val Text)
rhzName = lens _route53HostedZoneName (\s a -> s { _route53HostedZoneName = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-route53-hostedzone.html#cfn-route53-hostedzone-vpcs
rhzVPCs :: Lens' Route53HostedZone (Maybe [Route53HostedZoneVPC])
rhzVPCs = lens _route53HostedZoneVPCs (\s a -> s { _route53HostedZoneVPCs = a })
