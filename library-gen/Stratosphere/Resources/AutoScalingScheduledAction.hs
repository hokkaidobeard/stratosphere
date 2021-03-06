{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-as-scheduledaction.html

module Stratosphere.Resources.AutoScalingScheduledAction where

import Control.Lens hiding ((.=))
import Data.Aeson
import Data.Maybe (catMaybes)
import Data.Monoid (mempty)
import Data.Text

import Stratosphere.Values


-- | Full data type definition for AutoScalingScheduledAction. See
-- 'autoScalingScheduledAction' for a more convenient constructor.
data AutoScalingScheduledAction =
  AutoScalingScheduledAction
  { _autoScalingScheduledActionAutoScalingGroupName :: Val Text
  , _autoScalingScheduledActionDesiredCapacity :: Maybe (Val Integer)
  , _autoScalingScheduledActionEndTime :: Maybe (Val Text)
  , _autoScalingScheduledActionMaxSize :: Maybe (Val Integer)
  , _autoScalingScheduledActionMinSize :: Maybe (Val Integer)
  , _autoScalingScheduledActionRecurrence :: Maybe (Val Text)
  , _autoScalingScheduledActionStartTime :: Maybe (Val Text)
  } deriving (Show, Eq)

instance ToJSON AutoScalingScheduledAction where
  toJSON AutoScalingScheduledAction{..} =
    object $
    catMaybes
    [ (Just . ("AutoScalingGroupName",) . toJSON) _autoScalingScheduledActionAutoScalingGroupName
    , fmap (("DesiredCapacity",) . toJSON . fmap Integer') _autoScalingScheduledActionDesiredCapacity
    , fmap (("EndTime",) . toJSON) _autoScalingScheduledActionEndTime
    , fmap (("MaxSize",) . toJSON . fmap Integer') _autoScalingScheduledActionMaxSize
    , fmap (("MinSize",) . toJSON . fmap Integer') _autoScalingScheduledActionMinSize
    , fmap (("Recurrence",) . toJSON) _autoScalingScheduledActionRecurrence
    , fmap (("StartTime",) . toJSON) _autoScalingScheduledActionStartTime
    ]

instance FromJSON AutoScalingScheduledAction where
  parseJSON (Object obj) =
    AutoScalingScheduledAction <$>
      (obj .: "AutoScalingGroupName") <*>
      fmap (fmap (fmap unInteger')) (obj .:? "DesiredCapacity") <*>
      (obj .:? "EndTime") <*>
      fmap (fmap (fmap unInteger')) (obj .:? "MaxSize") <*>
      fmap (fmap (fmap unInteger')) (obj .:? "MinSize") <*>
      (obj .:? "Recurrence") <*>
      (obj .:? "StartTime")
  parseJSON _ = mempty

-- | Constructor for 'AutoScalingScheduledAction' containing required fields
-- as arguments.
autoScalingScheduledAction
  :: Val Text -- ^ 'assaAutoScalingGroupName'
  -> AutoScalingScheduledAction
autoScalingScheduledAction autoScalingGroupNamearg =
  AutoScalingScheduledAction
  { _autoScalingScheduledActionAutoScalingGroupName = autoScalingGroupNamearg
  , _autoScalingScheduledActionDesiredCapacity = Nothing
  , _autoScalingScheduledActionEndTime = Nothing
  , _autoScalingScheduledActionMaxSize = Nothing
  , _autoScalingScheduledActionMinSize = Nothing
  , _autoScalingScheduledActionRecurrence = Nothing
  , _autoScalingScheduledActionStartTime = Nothing
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-as-scheduledaction.html#cfn-as-scheduledaction-asgname
assaAutoScalingGroupName :: Lens' AutoScalingScheduledAction (Val Text)
assaAutoScalingGroupName = lens _autoScalingScheduledActionAutoScalingGroupName (\s a -> s { _autoScalingScheduledActionAutoScalingGroupName = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-as-scheduledaction.html#cfn-as-scheduledaction-desiredcapacity
assaDesiredCapacity :: Lens' AutoScalingScheduledAction (Maybe (Val Integer))
assaDesiredCapacity = lens _autoScalingScheduledActionDesiredCapacity (\s a -> s { _autoScalingScheduledActionDesiredCapacity = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-as-scheduledaction.html#cfn-as-scheduledaction-endtime
assaEndTime :: Lens' AutoScalingScheduledAction (Maybe (Val Text))
assaEndTime = lens _autoScalingScheduledActionEndTime (\s a -> s { _autoScalingScheduledActionEndTime = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-as-scheduledaction.html#cfn-as-scheduledaction-maxsize
assaMaxSize :: Lens' AutoScalingScheduledAction (Maybe (Val Integer))
assaMaxSize = lens _autoScalingScheduledActionMaxSize (\s a -> s { _autoScalingScheduledActionMaxSize = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-as-scheduledaction.html#cfn-as-scheduledaction-minsize
assaMinSize :: Lens' AutoScalingScheduledAction (Maybe (Val Integer))
assaMinSize = lens _autoScalingScheduledActionMinSize (\s a -> s { _autoScalingScheduledActionMinSize = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-as-scheduledaction.html#cfn-as-scheduledaction-recurrence
assaRecurrence :: Lens' AutoScalingScheduledAction (Maybe (Val Text))
assaRecurrence = lens _autoScalingScheduledActionRecurrence (\s a -> s { _autoScalingScheduledActionRecurrence = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-as-scheduledaction.html#cfn-as-scheduledaction-starttime
assaStartTime :: Lens' AutoScalingScheduledAction (Maybe (Val Text))
assaStartTime = lens _autoScalingScheduledActionStartTime (\s a -> s { _autoScalingScheduledActionStartTime = a })
