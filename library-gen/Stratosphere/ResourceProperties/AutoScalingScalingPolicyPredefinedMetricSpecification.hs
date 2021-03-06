{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-autoscaling-scalingpolicy-predefinedmetricspecification.html

module Stratosphere.ResourceProperties.AutoScalingScalingPolicyPredefinedMetricSpecification where

import Control.Lens hiding ((.=))
import Data.Aeson
import Data.Maybe (catMaybes)
import Data.Monoid (mempty)
import Data.Text

import Stratosphere.Values


-- | Full data type definition for
-- AutoScalingScalingPolicyPredefinedMetricSpecification. See
-- 'autoScalingScalingPolicyPredefinedMetricSpecification' for a more
-- convenient constructor.
data AutoScalingScalingPolicyPredefinedMetricSpecification =
  AutoScalingScalingPolicyPredefinedMetricSpecification
  { _autoScalingScalingPolicyPredefinedMetricSpecificationPredefinedMetricType :: Val Text
  , _autoScalingScalingPolicyPredefinedMetricSpecificationResourceLabel :: Maybe (Val Text)
  } deriving (Show, Eq)

instance ToJSON AutoScalingScalingPolicyPredefinedMetricSpecification where
  toJSON AutoScalingScalingPolicyPredefinedMetricSpecification{..} =
    object $
    catMaybes
    [ (Just . ("PredefinedMetricType",) . toJSON) _autoScalingScalingPolicyPredefinedMetricSpecificationPredefinedMetricType
    , fmap (("ResourceLabel",) . toJSON) _autoScalingScalingPolicyPredefinedMetricSpecificationResourceLabel
    ]

instance FromJSON AutoScalingScalingPolicyPredefinedMetricSpecification where
  parseJSON (Object obj) =
    AutoScalingScalingPolicyPredefinedMetricSpecification <$>
      (obj .: "PredefinedMetricType") <*>
      (obj .:? "ResourceLabel")
  parseJSON _ = mempty

-- | Constructor for 'AutoScalingScalingPolicyPredefinedMetricSpecification'
-- containing required fields as arguments.
autoScalingScalingPolicyPredefinedMetricSpecification
  :: Val Text -- ^ 'assppmsPredefinedMetricType'
  -> AutoScalingScalingPolicyPredefinedMetricSpecification
autoScalingScalingPolicyPredefinedMetricSpecification predefinedMetricTypearg =
  AutoScalingScalingPolicyPredefinedMetricSpecification
  { _autoScalingScalingPolicyPredefinedMetricSpecificationPredefinedMetricType = predefinedMetricTypearg
  , _autoScalingScalingPolicyPredefinedMetricSpecificationResourceLabel = Nothing
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-autoscaling-scalingpolicy-predefinedmetricspecification.html#cfn-autoscaling-scalingpolicy-predefinedmetricspecification-predefinedmetrictype
assppmsPredefinedMetricType :: Lens' AutoScalingScalingPolicyPredefinedMetricSpecification (Val Text)
assppmsPredefinedMetricType = lens _autoScalingScalingPolicyPredefinedMetricSpecificationPredefinedMetricType (\s a -> s { _autoScalingScalingPolicyPredefinedMetricSpecificationPredefinedMetricType = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-autoscaling-scalingpolicy-predefinedmetricspecification.html#cfn-autoscaling-scalingpolicy-predefinedmetricspecification-resourcelabel
assppmsResourceLabel :: Lens' AutoScalingScalingPolicyPredefinedMetricSpecification (Maybe (Val Text))
assppmsResourceLabel = lens _autoScalingScalingPolicyPredefinedMetricSpecificationResourceLabel (\s a -> s { _autoScalingScalingPolicyPredefinedMetricSpecificationResourceLabel = a })
