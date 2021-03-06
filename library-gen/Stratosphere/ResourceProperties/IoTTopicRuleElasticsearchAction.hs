{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iot-elasticsearch.html

module Stratosphere.ResourceProperties.IoTTopicRuleElasticsearchAction where

import Control.Lens hiding ((.=))
import Data.Aeson
import Data.Maybe (catMaybes)
import Data.Monoid (mempty)
import Data.Text

import Stratosphere.Values


-- | Full data type definition for IoTTopicRuleElasticsearchAction. See
-- 'ioTTopicRuleElasticsearchAction' for a more convenient constructor.
data IoTTopicRuleElasticsearchAction =
  IoTTopicRuleElasticsearchAction
  { _ioTTopicRuleElasticsearchActionEndpoint :: Val Text
  , _ioTTopicRuleElasticsearchActionId :: Val Text
  , _ioTTopicRuleElasticsearchActionIndex :: Val Text
  , _ioTTopicRuleElasticsearchActionRoleArn :: Val Text
  , _ioTTopicRuleElasticsearchActionType :: Val Text
  } deriving (Show, Eq)

instance ToJSON IoTTopicRuleElasticsearchAction where
  toJSON IoTTopicRuleElasticsearchAction{..} =
    object $
    catMaybes
    [ (Just . ("Endpoint",) . toJSON) _ioTTopicRuleElasticsearchActionEndpoint
    , (Just . ("Id",) . toJSON) _ioTTopicRuleElasticsearchActionId
    , (Just . ("Index",) . toJSON) _ioTTopicRuleElasticsearchActionIndex
    , (Just . ("RoleArn",) . toJSON) _ioTTopicRuleElasticsearchActionRoleArn
    , (Just . ("Type",) . toJSON) _ioTTopicRuleElasticsearchActionType
    ]

instance FromJSON IoTTopicRuleElasticsearchAction where
  parseJSON (Object obj) =
    IoTTopicRuleElasticsearchAction <$>
      (obj .: "Endpoint") <*>
      (obj .: "Id") <*>
      (obj .: "Index") <*>
      (obj .: "RoleArn") <*>
      (obj .: "Type")
  parseJSON _ = mempty

-- | Constructor for 'IoTTopicRuleElasticsearchAction' containing required
-- fields as arguments.
ioTTopicRuleElasticsearchAction
  :: Val Text -- ^ 'ittreaEndpoint'
  -> Val Text -- ^ 'ittreaId'
  -> Val Text -- ^ 'ittreaIndex'
  -> Val Text -- ^ 'ittreaRoleArn'
  -> Val Text -- ^ 'ittreaType'
  -> IoTTopicRuleElasticsearchAction
ioTTopicRuleElasticsearchAction endpointarg idarg indexarg roleArnarg typearg =
  IoTTopicRuleElasticsearchAction
  { _ioTTopicRuleElasticsearchActionEndpoint = endpointarg
  , _ioTTopicRuleElasticsearchActionId = idarg
  , _ioTTopicRuleElasticsearchActionIndex = indexarg
  , _ioTTopicRuleElasticsearchActionRoleArn = roleArnarg
  , _ioTTopicRuleElasticsearchActionType = typearg
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iot-elasticsearch.html#cfn-iot-elasticsearch-endpoint
ittreaEndpoint :: Lens' IoTTopicRuleElasticsearchAction (Val Text)
ittreaEndpoint = lens _ioTTopicRuleElasticsearchActionEndpoint (\s a -> s { _ioTTopicRuleElasticsearchActionEndpoint = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iot-elasticsearch.html#cfn-iot-elasticsearch-id
ittreaId :: Lens' IoTTopicRuleElasticsearchAction (Val Text)
ittreaId = lens _ioTTopicRuleElasticsearchActionId (\s a -> s { _ioTTopicRuleElasticsearchActionId = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iot-elasticsearch.html#cfn-iot-elasticsearch-index
ittreaIndex :: Lens' IoTTopicRuleElasticsearchAction (Val Text)
ittreaIndex = lens _ioTTopicRuleElasticsearchActionIndex (\s a -> s { _ioTTopicRuleElasticsearchActionIndex = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iot-elasticsearch.html#cfn-iot-elasticsearch-rolearn
ittreaRoleArn :: Lens' IoTTopicRuleElasticsearchAction (Val Text)
ittreaRoleArn = lens _ioTTopicRuleElasticsearchActionRoleArn (\s a -> s { _ioTTopicRuleElasticsearchActionRoleArn = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iot-elasticsearch.html#cfn-iot-elasticsearch-type
ittreaType :: Lens' IoTTopicRuleElasticsearchAction (Val Text)
ittreaType = lens _ioTTopicRuleElasticsearchActionType (\s a -> s { _ioTTopicRuleElasticsearchActionType = a })
